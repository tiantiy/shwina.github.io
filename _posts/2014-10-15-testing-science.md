---
layout: post
title: "Testing Scientific Code"
---

![Does My Code Work?]({{site.url}}/assets/phd033114s.gif)

Is scientific code really testable?
I heard a story recently about
a chemical engineer who said,
"If I could test my code, I would have published by now."
This is something that *characterizes* scientific code---
we write it because we *don't know* what the answer is.
Therefore, we can't write tests for it.
And so testing scientific code is an oxymoron.
And we shouldn't waste our time trying to do it.
Right?

Of course not.

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
And whether or not you call that bit 'testing',
you're still doing it.
What's more - you can *document* the way you're doing it,
often in code,
and without realizing it,
you've written a test for your code.

# How are ~~scientists~~ grad students testing code?

OK. I Don't have the data.
I can't tell you how scientists are testing their code.
But I *can* [extrapolate](http://xkcd.com/605/) from the
way I've tested code,
and seen other grad students test code.

#### It looks OK
Generally applied during earlier
stages of code development.
You write some code,
visualize the results,
and if *it looks OK*, move on. This is by no means
a poor method of testing, and provides quick,
frequent feedback.
It is of course incomplete, and I've almost
always regretted relying entirely on *it looks OK*.

#### Test Oracle

#### Extrapolation

#### Unit Tests
