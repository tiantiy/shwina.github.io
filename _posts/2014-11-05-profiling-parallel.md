---
layout: post
title: "Profiling Parallel Code"
---

In high performance computing,
performance is kind of a big deal.
And the first step in performance analysis 
and performance *improvement*
is
[profiling](http://en.wikipedia.org/wiki/Profiling_%28computer_programming%29).

High-performance computing almost always entails some
form of [parallelism](http://en.wikipedia.org/wiki/Parallel_computing).
And parallel programs are plain hard. They're harder to write,
harder to debug, and harder to profile.

# gprof

`gprof` is pretty great. Just compile your code with `-pg`, and `-g`,

{% highlight bash %}
$ gcc -pg -g -O0 hello.c bye.c -o hibye.exe
{% endhighlight %}

run your code as usual,

{% highlight bash %}
$ ./hibye.exe
{% endhighlight %}

and you'll see `gmon.out`. Now,

{% highlight bash %}
$ gprof hibye.exe gmon.out
{% endhighlight %}

should summarize the performance of your code.
Beware, `gprof` will not
pick up on any calls to shared library functions.
OK, that's a downer, and
there's lots more. But it's easy to use, and gives me quick results.
With the legacy code I work with, where there *are* no shared library calls,
`gprof` is pretty awesome.

# gprof + MPI

`gprof` isn't designed to work with MPI code.
But, as is generally the case with these things,
it's possible with sufficient abuse:

First, set the environment variable `GMON_OUT_PREFIX`:

{% highlight bash %}
$ export GMON_OUT_PREFIX=gmon.out-
{% endhighlight %}

Then, the usual business:

{% highlight bash %}
$ mpicc -pg -g -O0 hello.c bye.c -o hibye.exe
$ mpiexec -n 32 hibye.exe
{% endhighlight %}

You should see 32 (or however many processes) files,
with names `gmon.out-<pid>`.
This is an undocumented feature of `glibc`,
and it really shouldn't be - it's massively useful.

Now you have a separate `gmon.out` file for every
MPI process. Awesome. Sum them:

{% highlight bash %}
$ gprof -s hibye.exe gmon.out-*
{% endhighlight %}

And use the resulting `gmon.sum` to generate
`gprof` output:

{% highlight bash %}
$ gprof hibye.exe gmon.sum
{% endhighlight %}

[Credit](http://cluster.earlham.edu/wiki/index.php/Cluster:Gprof#Basic_Recipe_-_Parallel_MPI_Code)
where it's due. 
Now, I haven't figured out how to replace the `pid`
with the MPI rank - 
this could be exponentially more useful to some users.
And the method mentioned in the source doesn't really
seem to be working.
But I'm sure this is possible with some ingenuity.
