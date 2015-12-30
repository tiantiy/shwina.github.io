---
layout: post
title: "Using PETSc for Python with PyCUDA"
---

[PETSc](http://www.mcs.anl.gov/petsc/)
is a framework for
doing scientific computation in parallel.
Specifically,
PETSc provides tools and data structures for
assembling, manipulating and operating on
distributed Vectors and Matrices,
and linear and non-linear equation solvers
built on these tools and data structures.
PETSc is available for C, C++ and Fortran.
The
[petsc4py](https://bitbucket.org/petsc/petsc4py)
library provides Python bindings for PETSc.

PETSc supports the use of CUDA GPUs via the
[CUSP](https://developer.nvidia.com/cusp) C++ library.
The PETSc provided `VECCUSP` and `AIJCUSP` classes
are used to store vectors and matrices respectively on GPUs.
Vector operations and matrix vector products
with these classes are performed on the GPU.
All the PETSc linear solvers (except BiCG)
are thus able to run entirely on the GPU.

Sometimes, you'll want to perform computations with vectors
that can't be expressed using the available vector operations
or matrix-vector products.
In this case, you'll need access to the
underlying GPU (device) buffer,
which you pass to your own CUDA kernel that performs the computation.

In C++, this is done using the PETSc functions
`VecCUSPGetArrayRead` and `VecCUSPGetArrayWrite`
that expose the underlying CUSP vectors.
From the CUSP vector,
you can get a pointer to the raw device memory
using the `thrust::raw_pointer_cast` function.
This device pointer can be passed to your own custom kernels,
functions from other GPU libraries, whatever.
See a few examples of this [here]
(http://www.mcs.anl.gov/petsc/petsc-current/src/vec/vec/impls/seq/seqcusp/veccusp.cu#VecCUSPGetCUDAArray).

Here's how to do it with `petsc4py` and PyCUDA.
We'll dot two vectors using a custom kernel.
The following bits of code all go in a single Python script `petdot.py`.
First, we'll create the input and output vectors:

{% highlight python %}
from petsc4py import PETSc
from pycuda import autoinit
import pycuda.driver as cuda
import pycuda.compiler as compiler
import pycuda.gpuarray as gpuarray
import numpy as np

N = 8

# create input vectors
a = PETSc.Vec().create()
a.setType('cusp')
a.setSizes(N)

b = PETSc.Vec().create()
b.setType('cusp')
b.setSizes(N)

# create output vectors
c = PETSc.Vec().create()
c.setType('cusp')
c.setSizes(N)

# set initial values:
a.set(3.0)
b.set(2.0)
c.set(0.0)
{% endhighlight %}

Next, we'll use the `getCUDAHandle` method
to get the raw CUDA pointers
of the underlying GPU buffers:

{% highlight python %}
a_ptr = a.getCUDAHandle()
b_ptr = b.getCUDAHandle()
c_ptr = c.getCUDAHandle()
{% endhighlight %}

Next, we'll write a CUDA kernel implementing
the dot product, and use PyCUDA to interface with it:

{% highlight python %}
kernel_text = '''
__global__ void gpuDot(double* a_d,
    double* b_d, double* c_d, int n) {
    int i = threadIdx.x + blockIdx.x*blockDim.x;
    c_d[i] = a_d[i]*b_d[i];
}
'''

dot = compiler.SourceModule(kernel_text,
        options=['-O2']).get_function('gpuDot')
dot.prepare('PPPi')
{% endhighlight %}

Now, we'll perform the dot product:

{% highlight python %}
dot.prepared_call((1, 1, 1), (N, 1, 1),
    a_ptr, b_ptr, c_ptr, N)
{% endhighlight %}

The API requires us to "restore" the CUDA handles:

{% highlight python %}
a.restoreCUDAHandle(a_ptr)
b.restoreCUDAHandle(b_ptr)
c.restoreCUDAHandle(c_ptr)
{% endhighlight %}

Now look at the output vector:
{% highlight python %}
c.view()
{% endhighlight %}


Here's a run of the above program on 2 processes:

~~~
[atrikut@node0080 sandbox]$ mpiexec -n 2 python petdot.py 
Vec Object: 2 MPI processes
  type: mpicusp
Process [0]
6.
6.
6.
6.
Process [1]
6.
6.
6.
6.
~~~

You can also use the
raw pointer to construct a PyCUDA GPUArray,
or pass it to a function from the
`scikits.cuda` library, whatever.
