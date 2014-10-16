---
layout: post
title: "Testing Scientific Code"
---

![Does My Code Work?]({{site.url}}/assets/phd033114s.gif)

People often tell me they're "writing a program",
or "writing code that does *x*".
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

*"If I knew what my code was supposed to do, I would have published by now."*

This is something that *characterizes* scientific code --
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

#### It looks OK
"It looks OK" is generally applied during earlier
stages of code development.
You write some code,
visualize the results, i.e.,
plot a graph or print some statistics,
and if *it looks OK*, move on. This is by no means
a poor method of testing: it provides quick,
frequent feedback and can help fix bugs early.
It is of course incomplete, and I've almost
always regretted relying entirely on *it looks OK*.

#### Test Oracle
Most grad students write code that aspires to
*reproduce* some results -
either experimental data,
or results from another code.
These 
The effectiveness of the method obviously depends on
how good the oracles are and the features
of the software that they test.

#### Unit Tests
Some grad students write unit tests. The idea
behind unit testing is that 
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

