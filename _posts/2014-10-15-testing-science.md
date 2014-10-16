---
layout: post
title: "Testing Scientific Code"
---

![Does My Code Work?]({{site.url}}/assets/phd033114s.gif)

People often tell me they're *writing a program*,
or *writing code that does "x"*.
There's a certain hesitation,
*contempt* almost, in the scientific community,
associated with the word *software* - as if
writing software just isn't something scientists do.
I suspect that this has to do with what calling it
*software* says about your code -
that it works. It's reliable, it's friendly,
and most importantly, it's *testable*.

So, is scientific code really testable?
I heard a story recently about
a chemical engineer who said,

*If I knew what my code was supposed to do, I would have published by now.*

I see the point. 
Something that *characterizes* scientific code is that
we write it because we *don't know* what the answer is.
Therefore, we can't write tests for it.

And so testing scientific code is an oxymoron.

And we shouldn't waste our time trying to do it. 

Right?

We're guaranteed by the
[scientific method](http://en.wikipedia.org/wiki/Scientific_method)
that our answers are testable.
In fact,
it's this testability that differentiates
science from non-science.
If you're going to publish your results,
you're going to have to convince somebody
that your code works.
Before you do that, you have to convince
*yourself* that your code works.
And whether or not you call that bit *testing*,
you're still doing it.
What's more - you can *document* the way you're doing it,
often in code.
And without realizing it,
you've tested your code.

# How are ~~scientists~~ grad students testing code?

OK. I Don't have the data.
I can't tell you how scientists are testing their code.
But I *can* [extrapolate](http://xkcd.com/605/) from the
way I've tested code,
and seen other grad students test code.

**It looks OK**

"It looks OK" is generally applied during earlier
stages of code development.
You write some code,
summarize some results, e.g.,
plot a graph or print some statistics,
and if *it looks OK*, move on. This is by no means
a poor method of testing: it provides quick,
frequent feedback and can help fix bugs early.
It is of course, incomplete, and provides
no new information other than 'something is wrong
somewhere'.

It looks OK is particularly effective 
in interactive programming environments,
where you don't have to 
do an edit-compile-link-run cycle 
before you can perform a check.

**Test Oracle**

Most grad students write code that aspires to
*reproduce* some results:
either experimental data,
or results from another code - known as
*test oracles*.
The effectiveness of the method obviously depends on
how good the oracles are and the features
of the software that they test.
For example, does the experimental data collected
exercise the entire range of input parameters
that the code is going to be used for?
Does it cover edge cases?

Test oracles are great in the Verification and
Validation stage of development. But they're
not so useful in the earlier development cycles,
and it's a terrible idea to wait that long before
doing any testing.

**Unit Tests**

Some grad students write unit tests. 
The idea is that
if you test small pieces of code
individually and extensively,
then you can be confident that your software works.
We're also taught that writing code
that can be unit-tested leads to better design, 
i.e.,
by dividing your code into small pieces that can
each be run independently,
you're getting modularity, reuseability and
all that good stuff *in addition* to
testability.

I'm going to admit it. 
I'm a complete sucker for unit testing -- 
the *idea* behind unit testing. 
In practice,
I write tests that resemble unit tests,
but they might test larger bits of code than
typical unit tests do. 
They might take longer than
unit tests are supposed to.
But it works for me.
Writing these "unit tests" doesn't take me a lot of time,
so I can write a lot of them.
With *automated testing frameworks*, I can run them often.
And it makes catching and fixing bugs a whole lot easier.

# Which is better?

Use all of them.
Any testing guru will tell you that
some testing is better than no testing.
And so *all the testing* is better than some testing.
Like Ned Batchelder said: 

*How often have you heard someone say, "I wrote a lot of tests, but it wasn't worth it, so I deleted them." They don't. Tests are good.*

# What makes good tests?

* [Coverage](http://martinfowler.com/bliki/TestCoverage.html) 
is *generally* a good measure for the quality of tests, i.e., 
what percentage of code is actually being exercised 
by the tests.

* When good tests fail,
they tell you *exactly* where the problem is,
down to a few lines of code.

* Good tests can be run often,
so they're not computationally intensive.
If testing is going to take me more than a few seconds,
I'm not going to do it.

* Good tests cover the edge cases.

# Where to learn about testing?

OK. I've said enough about testing without really
quantifying anything. What *is* a test and how to write one?
You can definitely do better than learn from this blog.
Here are my favourite resources on testing:

* [Ned Batchelder - Getting Started Testing (text)](http://nedbatchelder.com/text/test0.html)

* [Software Carpentry - Defensive Programming with Python (text)](http://software-carpentry.org/v5/novice/python/05-defensive.html)

* [Scipy 2013 - Unit Testing for Scientific Software (video)](http://conference.scipy.org/scipy2013/tutorial_detail.php?id=106)