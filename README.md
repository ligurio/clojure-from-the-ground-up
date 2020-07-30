## Clojure from the ground up

### Welcome

This guide aims to introduce newcomers and experienced programmers alike to the
beauty of functional programming, starting with the simplest building blocks of
software. You’ll need a computer, basic proficiency in the command line, a text
editor, and an internet connection. By the end of this series, you’ll have a
thorough command of the Clojure programming language.

#### Who is this guide for?

Science, technology, engineering, and mathematics are deeply rewarding fields,
yet few women enter STEM as a career path. Still more are discouraged by a
culture which repeatedly asserts that women lack the analytic aptitude for
writing software, that they are not driven enough to be successful scientists,
that it’s not cool to pursue a passion for structural engineering. Those few
with the talent, encouragement, and persistence to break in to science and tech
are discouraged by persistent sexism in practice: the old boy’s club of tenure,
being passed over for promotions, isolation from peers, and flat-out assault.
This landscape sucks. I want to help change it.

Women Who Code, PyLadies, Black Girls Code, RailsBridge, Girls Who Code, Girl
Develop It, and Lambda Ladies are just a few of the fantastic groups helping
women enter and thrive in software. I wholeheartedly support these efforts.

In addition, I want to help in my little corner of the technical
community–functional programming and distributed systems–by making high-quality
educational resources available for free. The
[Jepsen](https://aphyr.com/tags/jepsen) series has been, in part, an effort to
share my enthusiasm for distributed systems with beginners of all stripes–but
especially for women, LGBT folks, and people of color.

As technical authors, we often assume that our readers are white, that our
readers are straight, that our readers are traditionally male. This is the
invisible default in US culture, and it’s especially true in tech. People
continue to assume on the basis of my software and writing that I’m straight,
because well hey, it’s a statistically reasonable assumption.

But I’m not straight. I get called faggot, cocksucker, and sinner. People say
they’ll pray for me. When I walk hand-in-hand with my boyfriend, people roll
down their car windows and stare. They threaten to beat me up or kill me. Every
day I’m aware that I’m the only gay person some people know, and that I can
show that not all gay people are effeminate, or hypermasculine, or ditzy, or
obsessed with image. That you can be a manicurist or a mathematician or both.
Being different, being a stranger in your culture, comes with all kinds of
challenges. I can’t speak to everyone’s experience, but I can take a pretty
good guess.

At the same time, in the technical community I’ve found overwhelming warmth and
support, from people of all stripes. My peers stand up for me every day, and
I’m so thankful–especially you straight dudes–for understanding a bit of what
it’s like to be different. I want to extend that same understanding, that same
empathy, to people unlike myself. Moreover, I want to reassure everyone that
though they may feel different, they do have a place in this community.

So before we begin, I want to reinforce that you can program, that you can do
math, that you can design car suspensions and fire suppression systems and
spacecraft control software and distributed databases, regardless of what your
classmates and media and even fellow engineers think. You don’t have to be
white, you don’t have to be straight, you don’t have to be a man. You can grow
up never having touched a computer and still become a skilled programmer. Yeah,
it’s harder–and yeah, people will give you shit, but that’s not your fault and
has nothing to do with your ability or your right to do what you love. All it
takes to be a good engineer, scientist, or mathematician is your curiosity,
your passion, the right teaching material, and putting in the hours.

There’s nothing in this guide that’s just for lesbian grandmas or just for
mixed-race kids; bros, you’re welcome here too. There’s nothing dumbed down.
We’re gonna go as deep into the ideas of programming as I know how to go, and
we’re gonna do it with everyone on board.

No matter who you are or who people think you are, this guide is for you.

#### Why Clojure?

This book is about how to program. We’ll be learning in Clojure, which is a
modern dialect of a very old family of computer languages, called Lisp. You’ll
find that many of this book’s ideas will translate readily to other languages;
though they may be expressed in [different
ways](http://aphyr.com/posts/266-core-language-concepts).

We’re going to explore the nature of syntax, metalanguages, values, references,
mutation, control flow, and concurrency. Many languages leave these ideas
implicit in the language construction, or don’t have a concept of metalanguages
or concurrency at all. Clojure makes these ideas explicit, first-class language
constructs.

At the same time, we’re going to defer or omit any serious discussion of static
type analysis, hardware, and performance. This is not to say that these ideas
aren’t important; just that they don’t fit well within this particular
narrative arc. For a deep exploration of type theory I recommend a study in
Haskell, and for a better understanding of underlying hardware, learning C and
an assembly language will undoubtedly help.

In more general terms, Clojure is a well-rounded language. It offers broad
library support and runs on multiple operating systems. Clojure performance is
not terrific, but is orders of magnitude faster than Ruby, Python, or
Javascript. Unlike some faster languages, Clojure emphasizes safety in its type
system and approach to parallelism, making it easier to write correct
multithreaded programs. Clojure is concise, requiring very little code to
express complex operations. It offers a REPL and dynamic type system: ideal for
beginners to experiment with, and well-suited for manipulating complex data
structures. A consistently designed standard library and full-featured set of
core datatypes rounds out the Clojure toolbox.

Finally, there are some drawbacks. As a compiled language, Clojure is much
slower to start than a scripting language; this makes it unsuitable for writing
small scripts for interactive use. Clojure is also not well-suited for
high-performance numeric operations. Though it is possible, you have to jump
through hoops to achieve performance comparable with Java. I’ll do my best to
call out these constraints and shortcomings as we proceed through the text.

With that context out of the way, let’s get started by installing Clojure!

#### Getting set up

First, you’ll need a Java Virtual Machine, or JVM, and its associated
development tools, called the JDK. This is the software which runs a Clojure
program. If you’re on Windows, install [Oracle JDK
1.7](http://www.oracle.com/technetwork/java/javase/downloads/index.html). If
you’re on OS X or Linux, you may already have a JDK installed. In a terminal,
try:

```clojure
which javac
```

If you see something like

```clojure
/usr/bin/javac
```

Then you’re good to go. If you don’t see any output from that command, install
the appropriate [Oracle JDK
1.7](http://www.oracle.com/technetwork/java/javase/downloads/index.html) for
your operating system, or whatever JDK your package manager has available.

When you have a JDK, you’ll need [Leiningen](http://leiningen.org/), the
Clojure build tool. If you’re on a Linux or OS X computer, the instructions
below should get you going right away. If you’re on Windows, see the Leiningen
page for an installer. If you get stuck, you might want to start with a [primer
on command line basics](http://blog.teamtreehouse.com/command-line-basics).

```shell
mkdir -p ~/bin
cd ~/bin
curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod a+x lein
```

Leiningen automatically handles installing Clojure, finding libraries from the
internet, and building and running your programs. We’ll create a new Leiningen
project to play around in:

```shell
cd
lein new scratch
```

This creates a new directory in your homedir, called `scratch`. If you see
`command not found` instead, it means the directory `~/bin` isn’t registered with
your terminal as a place to search for programs. To fix this, add the line

```shell
export PATH="$PATH":~/bin
```

to the file `.bash_profile` in your home directory, then run `source
~/.bash_profile`. Re-running `lein new scratch` should work.

Let’s enter that directory, and start using Clojure itself:

```shell
cd scratch
lein repl
```

#### The structure of programs

When you type `lein repl` at the terminal, you’ll see something like this:

```shell
aphyr@waterhouse:~/scratch$ lein repl
nREPL server started on port 45413
REPL-y 0.2.0
Clojure 1.5.1
    Docs: (doc function-name-here)
          (find-doc "part-of-name-here")
  Source: (source function-name-here)
 Javadoc: (javadoc java-object-or-class-here)
    Exit: Control+D or (exit) or (quit)

user=>
```

This is an interactive Clojure environment called a REPL, for “Read, Evaluate,
Print Loop”. It’s going to read a program we enter, run that program, and print
the results. REPLs give you quick feedback, so they’re a great way to explore a
program interactively, run tests, and prototype new ideas.

Let’s write a simple program. The simplest, in fact. Type “nil”, and hit enter.

```clojure
user=> nil
nil
```

`nil` is the most basic value in Clojure. It represents emptiness, nothing-doing,
not-a-thing. The absence of information.

```clojure
user=> true
true
user=> false
false
```

`true` and `false` are a pair of special values called Booleans. They mean exactly
what you think: whether a statement is true or false. `true`, `false`, and `nil` form
the three poles of the Lisp logical system.

```clojure
user=> 0
0
```

This is the number zero. Its numeric friends are `1`, `-47`, `1.2e-4`, `1/3`, and so
on. We might also talk about *strings*, which are chunks of text surrounded by
double quotes:

```clojure
user=> "hi there!"
"hi there!"
```

`nil`, `true`, `0`, and `"hi there!"` are all different types of *values*; the nouns of
programming. Just as one could say “House.” in English, we can write a program
like `"hello, world"` and it evaluates to itself: the string `"hello world"`. But
most sentences aren’t just about stating the existence of a thing; they involve
*action*. We need *verbs*.

```
user=> inc
#<core$inc clojure.core$inc@6f7ef41c>
```

This is a verb called `inc`–short for “increment”. Specifically, `inc` is a
*symbol* which points to a verb: #<core$inc clojure.core$inc@6f7ef41c>– just like
the word “run” is a *name* for the *concept* of running.

There’s a key distinction here–that a signifier, a reference, a label, is not
the same as the signified, the referent, the concept itself. If you write the
word “run” on paper, the ink means nothing by itself. It’s just a symbol. But
in the mind of a reader, that symbol takes on *meaning*; the idea of running.

Unlike the number 0, or the string “hi”, symbols are references to other
values. when Clojure evaluates a symbol, it looks up that symbol’s meaning.
Look up `inc`, and you get `#<core$inc clojure.core$inc@6f7ef41c>`.

Can we refer to the symbol itself, *without* looking up its meaning?

```clojure
user=> 'inc
inc
```

Yes. The single quote ' escapes a sentence. In programming languages, we call
sentences expressions or statements. A quote says “Rather than evaluating this
expression’s text, simply return the text itself, unchanged.” Quote a symbol,
get a symbol. Quote a number, get a number. Quote anything, and get it back
exactly as it came in.

```clojure
user=> '123
123
user=> '"foo"
"foo"
user=> '(1 2 3)
(1 2 3)
```

A new kind of value, surrounded by parentheses: the list. LISP originally stood
for LISt Processing, and lists are still at the core of the language. In fact,
they form the most basic way to compose expressions, or sentences. A list is a
single expression which has multiple parts. For instance, this list contains
three elements: the numbers 1, 2, and 3. Lists can contain anything: numbers,
strings, even other lists:

```clojure
user=> '(nil "hi")
(nil "hi")
```

A list containing two elements: the number 1, and a second list. That list
contains two elements: the number 2, and another list. That list contains two
elements: 3, and an empty list.

```clojure
user=> '(1 (2 (3 ())))
(1 (2 (3 ())))
```

You could think of this structure as a tree–which is a provocative idea,
because languages are like trees too: sentences are comprised of clauses, which
can be nested, and each clause may have subjects modified by adjectives, and
verbs modified by adverbs, and so on. “Lindsay, my best friend, took the dog
which we found together at the pound on fourth street, for a walk with her
mother Michelle.”

```clojure
Took
  Lindsay
    my best friend
  the dog
    which we found together
      at the pound
        on fourth street
    for a walk
      with her mother
        Michelle
```

But let’s try something simpler. Something we know how to talk about.
“Increment the number zero.” As a tree:

```clojure
Increment
  the number zero
```

We have a symbol for incrementing, and we know how to write the number zero.
Let’s combine them in a list:

```clojure
clj=> '(inc 0)
(inc 0)
```

A basic sentence. Remember, since it’s quoted, we’re talking about the tree,
the text, the expression, by itself. Absent interpretation. If we remove the
single-quote, Clojure will interpret the expression:

```clojure
user=> (inc 0)
1
```

Incrementing zero yields one. And if we wanted to increment that value?

```clojure
Increment
  increment
    the number zero
user=> (inc (inc 0))
2
```

A sentence in Lisp is a list. It starts with a verb, and is followed by zero or
more objects for that verb to act on. Each part of the list can itself be
another list, in which case that nested list is evaluated first, just like a
nested clause in a sentence. When we type

```clojure
(inc (inc 0))
```

Clojure first looks up the meanings for the symbols in the code:

```clojure
(#<core$inc clojure.core$inc@6f7ef41c>
  (#<core$inc clojure.core$inc@6f7ef41c>
    0))
```

Then evaluates the innermost list (inc 0), which becomes the number 1:

```clojure
(#<core$inc clojure.core$inc@6f7ef41c>
 1)
```

Finally, it evaluates the outer list, incrementing the number 1:

``clojure
2
```

Every list starts with a verb. Parts of a list are evaluated from left to
right. Innermost lists are evaluated before outer lists.

```clojure
(+ 1 (- 5 2) (+ 3 4))
(+ 1 3       (+ 3 4))
(+ 1 3       7)
11
```

That’s it.

The entire grammar of Lisp: the structure for every expression in the language.
We transform expressions by substituting meanings for symbols, and obtain some
result. This is the core of the Lambda Calculus, and it is the theoretical
basis for almost all computer languages. Ruby, Javascript, C, Haskell; all
languages express the text of their programs in different ways, but internally
all construct a tree of expressions. Lisp simply makes it explicit.

#### Review

We started by learning a few basic nouns: numbers like 5, strings like "cat",
and symbols like inc and +. We saw how quoting makes the difference between an
expression itself and the thing it evaluates to. We discovered symbols as names
for other values, just like how words represent concepts in any other language.
Finally, we combined lists to make trees, and used those trees to represent a
program.

With these basic elements of syntax in place, it’s time to expand our
vocabulary with new verbs and nouns; learning to represent more complex values
and transform them in different ways.

### Basic types

https://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types

### Functions

https://aphyr.com/posts/303-clojure-from-the-ground-up-functions

### Sequences

https://aphyr.com/posts/304-clojure-from-the-ground-up-sequences

### Macros

https://aphyr.com/posts/305-clojure-from-the-ground-up-macros

### State

https://aphyr.com/posts/306-clojure-from-the-ground-up-state

### Logistics

https://aphyr.com/posts/311-clojure-from-the-ground-up-logistics

### Modeling

https://aphyr.com/posts/312-clojure-from-the-ground-up-modeling

### Debugging

https://aphyr.com/posts/319-clojure-from-the-ground-up-debugging
