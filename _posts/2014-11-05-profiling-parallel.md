---
layout: post
title: "Profiling Parallel Code (under construction)"
---

In high performance computing, performance is kind of
a big deal. And step one in performance analysis is
[profiling](http://en.wikipedia.org/wiki/Profiling_%28computer_programming%29).

Test bash highlighting:

{% highlight bash %}
$ gprof -s app.out gmon.out-*
{% endhighlight %}