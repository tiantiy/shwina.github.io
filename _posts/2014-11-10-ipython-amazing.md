---
layout: post
title: "IPython Never Ceases To Amaze"
---

I wanted to look up
all the top-level, grid related functions
available in NumPy.
On the IPython shell,
on a whim,
I typed:

{% highlight shell %}
np.*grid*?
{% endhighlight %}

not knowing what to expect.
It did just what I wanted:

{% highlight shell %}
np.meshgrid
np.mgrid
np.ogrid
{% endhighlight %}

That made my day.
Thanks, IPython!