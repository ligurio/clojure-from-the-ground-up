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
*symbol* which points to a verb: `#<core$inc clojure.core$inc@6f7ef41c>` – just like
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

We’ve learned the basics of Clojure’s syntax and evaluation model. Now we’ll
take a tour of the basic nouns in the language.

#### Types

We’ve seen a few different values already–for instance, nil, true, false, 1,
2.34, and "meow". Clearly all these things are different values, but some of
them seem more alike than others.

For instance, 1 and 2 are very similar numbers; both can be added, divided,
multiplied, and subtracted. 2.34 is also a number, and acts very much like 1
and 2, but it’s not quite the same. It’s got decimal points. It’s not an
integer. And clearly true is not very much like a number. What is true plus
one? Or false divided by 5.3? These questions are poorly defined.

We say that a type is a group of values which work in the same way. It’s a
property that some values share, which allows us to organize the world into
sets of similar things. 1 + 1 and 1 + 2 use the same addition, which adds
together integers. Types also help us verify that a program makes sense: that
you can only add together numbers, instead of adding numbers to porcupines.

Types can overlap and intersect each other. Cats are animals, and cats are
fuzzy too. You could say that a cat is a member (or sometimes “instance”), of
the fuzzy and animal types. But there are fuzzy things like moss which aren’t
animals, and animals like alligators that aren’t fuzzy in the slightest.

Other types completely subsume one another. All tabbies are housecats, and all
housecats are felidae, and all felidae are animals. Everything which is true of
an animal is automatically true of a housecat. Hierarchical types make it
easier to write programs which don’t need to know all the specifics of every
value; and conversely, to create new types in terms of others. But they can
also get in the way of the programmer, because not every useful classification
(like “fuzziness”) is purely hierarchical. Expressing overlapping types in a
hierarchy can be tricky.

Every language has a type system; a particular way of organizing nouns into
types, figuring out which verbs make sense on which types, and relating types
to one another. Some languages are strict, and others more relaxed. Some
emphasize hierarchy, and others a more ad-hoc view of the world. We call
Clojure’s type system strong in that operations on improper types are simply
not allowed: the program will explode if asked to subtract a dandelion. We also
say that Clojure’s types are dynamic because they are enforced when the program
is run, instead of when the program is first read by the computer.

We’ll learn more about the formal relationships between types later, but for
now, keep this in the back of your head. It’ll start to hook in to other
concepts later.

#### Integers

Let’s find the type of the number 3:

```clojure
user=> (type 3)
java.lang.Long
```

So 3 is a java.lang.Long, or a “Long”, for short. Because Clojure is built on
top of Java, many of its types are plain old Java types.

Longs, internally, are represented as a group of sixty-four binary digits (ones
and zeroes), written down in a particular pattern called signed two’s
complement representation. You don’t need to worry about the specifics–there
are only two things to remember about longs. First, longs use one bit to store
the sign: whether the number is positive or negative. Second, the other 63 bits
represent the size of the number. That means the biggest number you can
represent with a long is 263 - 1 (the minus one is because of the number 0),
and the smallest long is -263.

How big is 2^63 - 1?

```clojure
user=> Long/MAX_VALUE
9223372036854775807
```

That’s a reasonably big number. Most of the time, you won’t need anything
bigger, but… what if you did? What happens if you add one to the biggest Long?

```clojure
user=> (inc Long/MAX_VALUE)

ArithmeticException integer overflow  clojure.lang.Numbers.throwIntOverflow (Numbers.java:1388)
```

An error occurs! This is Clojure telling us that something went wrong. The type
of error was an ArithmeticException, and its message was “integer overflow”,
meaning “this type of number can’t hold a number that big”. The error came from
a specific place in the source code of the program: Numbers.java, on line 1388.
That’s a part of the Clojure source code. Later, we’ll learn more about how to
unravel error messages and find out what went wrong.

The important thing is that Clojure’s type system protected us from doing
something dangerous; instead of returning a corrupt value, it aborted
evaluation and returned an error.

If you do need to talk about really big numbers, you can use a BigInt: an
arbitrary-precision integer. Let’s convert the biggest Long into a BigInt, then
increment it:

```clojure
user=> (inc (bigint Long/MAX_VALUE))
9223372036854775808N
```

Notice the N at the end? That’s how Clojure writes arbitrary-precision integers.

```clojure
user=> (type 5N)
clojure.lang.BigInt
```

There are also smaller numbers.

```clojure
user=> (type (int 0))
java.lang.Integer
user=> (type (short 0))
java.lang.Short
user=> (type (byte 0))
java.lang.Byte
```

Integers are half the size of Longs; they store values in 32 bits. Shorts are
16 bits, and Bytes are 8. That means their biggest values are 2^31-1, 2^15-1, and
2^7-1, respectively.

```clojure
user=> Integer/MAX_VALUE
2147483647
user=> Short/MAX_VALUE
32767
user=> Byte/MAX_VALUE
127
```

#### Fractional numbers

To represent numbers between integers, we often use floating-point numbers,
which can represent small numbers with fine precision, and large numbers with
coarse precision. Floats use 32 bits, and Doubles use 64. Doubles are the
default in Clojure.

```clojure
user=> (type 1.23)
java.lang.Double
user=> (type (float 1.23))
java.lang.Float
```

Floating point math is complicated, and we won’t get bogged down in the details
just yet. The important thing to know is floats and doubles are approximations.
There are limits to their correctness:

```clojure
user=> 0.99999999999999999
1.0
```

To represent fractions exactly, we can use the ratio type:

```clojure
user=> (type 1/3)
clojure.lang.Ratio
```

#### Mathematical operations

The exact behavior of mathematical operations in Clojure depends on their
types. In general, though, Clojure aims to preserve information. Adding two
longs returns a long; adding a double and a long returns a double.

```clojure
user=> (+ 1 2)
3
user=> (+ 1 2.0)
3.0
```

3 and 3.0 are not the same number; one is a long, and the other a double. But
for most purposes, they’re equivalent, and Clojure will tell you so:

```clojure
user=> (= 3 3.0)
false
user=> (== 3 3.0)
true
```

= asks whether all the things that follow are equal. Since floats are
approximations, = considers them different from integers. == also compares
things, but a little more loosely: it considers integers equivalent to their
floating-point representations.

We can also subtract with -, multiply with *, and divide with /.

```clojure
user=> (- 3 1)
2
user=> (* 1.5 3)
4.5
user=> (/ 1 2)
1/2
```

Putting the verb first in each list allows us to add or multiply more than one
number in the same step:

```clojure
user=> (+ 1 2 3)
6
user=> (* 2 3 1/5)
6/5
```

Subtraction with more than 2 numbers subtracts all later numbers from the
first. Division divides the first number by all the rest.

```clojure
user=> (- 5 1 1 1)
2
user=> (/ 24 2 3)
4
```

By extension, we can define useful interpretations for numeric operations with
just a single number:

```clojure
user=> (+ 2)
2
user=> (- 2)
-2
user=> (* 4)
4
user=> (/ 4)
1/4
```

We can also add or multiply a list of no numbers at all, obtaining the additive
and multiplicative identities, respectively. This might seem odd, especially
coming from other languages, but we’ll see later that these generalizations
make it easier to reason about higher-level numeric operations.

```clojure
user=> (+)
0
user=> (*)
1
```

Often, we want to ask which number is bigger, or if one number falls between
two others. <= means “less than or equal to”, and asserts that all following
values are in order from smallest to biggest.

```clojure
user=> (<= 1 2 3)
true
user=> (<= 1 3 2)
false
```

< means “strictly less than”, and works just like <=, except that no two values
may be equal.

```clojure
user=> (<= 1 1 2)
true
user=> (< 1 1 2)
false
```

Their friends > and >= mean “greater than” and “greater than or equal to”,
respectively, and assert that numbers are in descending order.

```clojure
user=> (> 3 2 1)
true
user=> (> 1 2 3)
false
```

Also commonly used are inc and dec, which add and subtract one to a number,
respectively:

```clojure
user=> (inc 5)
6
user=> (dec 5)
4
```

One final note: equality tests can take more than 2 numbers as well.

```clojure
user=> (= 2 2 2)
true
user=> (= 2 2 3)
false
```

#### Strings

We saw that strings are text, surrounded by double quotes, like "foo". Strings
in Clojure are, like Longs, Doubles, and company, backed by a Java type:

```clojure
user=> (type "cat")
java.lang.String
```

We can make almost anything into a string with str. Strings, symbols, numbers,
booleans; every value in Clojure has a string representation. Note that nil’s
string representation is ""; an empty string.

```clojure
user=> (str "cat")
"cat"
user=> (str 'cat)
"cat"
user=> (str 1)
"1"
user=> (str true)
"true"
user=> (str '(1 2 3))
"(1 2 3)"
user=> (str nil)
""
```

str can also combine things together into a single string, which we call
“concatenation”.

```clojure
user=> (str "meow " 3 " times")
"meow 3 times"
```

To look for patterns in text, we can use a regular expression, which is a tiny
language for describing particular arrangements of text. re-find and re-matches
look for occurrences of a regular expression in a string. To find a cat:

```clojure
user=> (re-find #"cat" "mystic cat mouse")
"cat"
user=> (re-find #"cat" "only dogs here")
nil
```

That #"..." is Clojure’s way of writing a regular expression.

With re-matches, you can extract particular parts of a string which match an
expression. Here we find two strings, separated by a :. The parentheses mean
that the regular expression should capture that part of the match. We get back
a list containing the part of the string that matched the first parentheses,
followed by the part that matched the second parentheses.

```clojure
user=> (rest (re-matches #"(.+):(.+)" "mouse:treat"))
("mouse" "treat")
```

Regular expressions are a powerful tool for searching and matching text,
especially when working with data files. Since regexes work the same in most
languages, you can use any guide online to learn more. It’s not something you
have to master right away; just learn specific tricks as you find you need
them. For a deeper guide, try Fitzgerald’s Introducing Regular Expressions.

#### Booleans and logic

Everything in Clojure has a sort of charge, a truth value, sometimes called
“truthiness”. true is positive and false is negative. nil is negative, too.

```clojure
user=> (boolean true)
true
user=> (boolean false)
false
user=> (boolean nil)
false
```

Every other value in Clojure is positive.

```clojure
user=> (boolean 0)
true
user=> (boolean 1)
true
user=> (boolean "hi there")
true
user=> (boolean str)
true
```

If you’re coming from a C-inspired language, where 0 is considered false, this
might be a bit surprising. Likewise, in much of POSIX, 0 is considered success
and nonzero values are failures. Lisp allows no such confusion: the only
negative values are false and nil.

We can reason about truth values using and, or, and not. and returns the first
negative value, or the last value if all are truthy.

```clojure
user=> (and true false true)
false
user=> (and true true true)
true
user=> (and 1 2 3)
3
```

Similarly, or returns the first positive value.

```clojure
user=> (or false 2 3)
2
user=> (or false nil)
nil
```

And not inverts the logical sense of a value:

```clojure
user=> (not 2)
false
user=> (not nil)
true
```

We’ll learn more about Boolean logic when we start talking about control flow;
the way we alter evaluation of a program and express ideas like “if I’m a cat,
then meow incessantly”.

#### Symbols

We saw symbols in the previous chapter; they’re bare strings of characters,
like foo or +.

```clojure
user=> (class 'str)
clojure.lang.Symbol
```

Symbols can have either short or full names. The short name is used to refer to
things locally. The fully qualified name is used to refer unambiguously to a
symbol from anywhere. If I were a symbol, my name would be “Kyle”, and my full
name “Kyle Kingsbury.”

Symbol names are separated with a /. For instance, the symbol str is also
present in a family called clojure.core; the corresponding full name is
clojure.core/str.

```clojure
user=> (= str clojure.core/str)
true
user=> (name 'clojure.core/str)
"str"
```

When we talked about the maximum size of an integer, that was a fully-qualified
symbol, too.

```clojure
(type 'Integer/MAX_VALUE)
clojure.lang.Symbol
```

The job of symbols is to refer to things, to point to other values. When
evaluating a program, symbols are looked up and replaced by their corresponding
values. That’s not the only use of symbols, but it’s the most common.

#### Keywords

Closely related to symbols and strings are keywords, which begin with a :.
Keywords are like strings in that they’re made up of text, but are specifically
intended for use as labels or identifiers. These aren’t labels in the sense of
symbols: keywords aren’t replaced by any other value. They’re just names, by
themselves.

```clojure
user=> (type :cat)
clojure.lang.Keyword
user=> (str :cat)
":cat"
user=> (name :cat)
"cat"
```

As labels, keywords are most useful when paired with other values in a
collection, like a map. Keywords can also be used as verbs to look up specific
values in other data types. We’ll learn more about keywords shortly.

#### Lists

A collection is a group of values. It’s a container which provides some
structure, some framework, for the things that it holds. We say that a
collection contains elements, or members. We saw one kind of collection–a
list–in the previous chapter.

```clojure
user=> '(1 2 3)
(1 2 3)
user=> (type '(1 2 3))
clojure.lang.PersistentList
```

Remember, we quote lists with a ' to prevent them from being evaluated. You can
also construct a list using list:

```clojure
user=> (list 1 2 3)
(1 2 3)
```

Lists are comparable just like every other value:

```clojure
user=> (= (list 1 2) (list 1 2))
true
```

You can modify a list by conjoining an element onto it:

```clojure
user=> (conj '(1 2 3) 4)
(4 1 2 3)
```

We added 4 to the list–but it appeared at the front. Why? Internally, lists are
stored as a chain of values: each link in the chain is a tiny box which holds
the value and a connection to the next link. This data structure, called a
linked list, offers immediate access to the first element.

```clojure
user=> (first (list 1 2 3))
1
```

But getting to the second element requires an extra hop down the chain

```clojure
user=> (second (list 1 2 3))
2
```

and the third element a hop after that, and so on.

```clojure
user=> (nth (list 1 2 3) 2)
3
```

nth gets the element of an ordered collection at a particular index. The first
element is index 0, the second is index 1, and so on.

This means that lists are well-suited for small collections, or collections which are read in linear order, but are slow when you want to get arbitrary elements from later in the list. For fast access to every element, we use a vector.

#### Vectors

Vectors are surrounded by square brackets, just like lists are surrounded by
parentheses. Because vectors aren’t evaluated like lists are, there’s no need
to quote them:

```clojure
user=> [1 2 3]
[1 2 3]
user=> (type [1 2 3])
clojure.lang.PersistentVector
```

You can also create vectors with vector, or change other structures into
vectors with vec:

```clojure
user=> (vector 1 2 3)
[1 2 3]
user=> (vec (list 1 2 3))
[1 2 3]
```

conj on a vector adds to the end, not the start:

```clojure
user=> (conj [1 2 3] 4)
[1 2 3 4]
```

Our friends first, second, and nth work here too; but unlike lists, nth is fast
on vectors. That’s because internally, vectors are represented as a very broad
tree of elements, where each part of the tree branches into 32 smaller trees.
Even very large vectors are only a few layers deep, which means getting to
elements only takes a few hops.

In addition to first, you’ll often want to get the remaining elements in a collection. There are two ways to do this:

```clojure
user=> (rest [1 2 3])
(2 3)
user=> (next [1 2 3])
(2 3)
```

rest and next both return “everything but the first element”. They differ only
by what happens when there are no remaining elements:

```clojure
user=> (rest [1])
()
user=> (next [1])
nil
```

rest returns logical true, next returns logical false. Each has their uses, but
in almost every case they’re equivalent–I interchange them freely.

We can get the final element of any collection with last:

```clojure
user=> (last [1 2 3])
3
```

And figure out how big the vector is with count:

```clojure
user=> (count [1 2 3])
3
```

Because vectors are intended for looking up elements by index, we can also use them directly as verbs:

```
user=> ([:a :b :c] 1)
:b
```

So we took the vector containing three keywords, and asked “What’s the element
at index 1?” Lisp, like most (but not all!) modern languages, counts up from
zero, not one. Index 0 is the first element, index 1 is the second element, and
so on. In this vector, finding the element at index 1 evaluates to :b.

Finally, note that vectors and lists containing the same elements are
considered equal in Clojure:

```clojure
user=> (= '(1 2 3) [1 2 3])
true
```

In almost all contexts, you can consider vectors, lists, and other sequences as
interchangeable. They only differ in their performance characteristics, and in
a few data-structure-specific operations.

#### Sets

Sometimes you want an unordered collection of values; especially when you plan
to ask questions like “does the collection have the number 3 in it?” Clojure,
like most languages, calls these collections sets.

```clojure
user=> #{:a :b :c}
#{:a :c :b}
```

Sets are surrounded by #{...}. Notice that though we gave the elements :a, :b,
and :c, they came out in a different order. In general, the order of sets can
shift at any time. If you want a particular order, you can ask for it as a list
or vector:

```clojure
user=> (vec #{:a :b :c})
[:a :c :b]
```

Or ask for the elements in sorted order:

```clojure
(sort #{:a :b :c})
(:a :b :c)
```

conj on a set adds an element:

```clojure
user=> (conj #{:a :b :c} :d)
#{:a :c :b :d}
user=> (conj #{:a :b :c} :a)
#{:a :c :b}
```

Sets never contain an element more than once, so conjing an element which is
already present does nothing. Conversely, one removes elements with disj:

```clojure
user=> (disj #{"hornet" "hummingbird"} "hummingbird")
#{"hornet"}
````

The most common operation with a set is to check whether something is inside
it. For this we use contains?.

```clojure
user=> (contains? #{1 2 3} 3)
true
user=> (contains? #{1 2 3} 5)
false
```

Like vectors, you can use the set itself as a verb. Unlike contains?, this
expression returns the element itself (if it was present), or nil.

```clojure
user=> (#{1 2 3} 3)
3
user=> (#{1 2 3} 4)
nil
```

You can make a set out of any other collection with set.

```clojure
user=> (set [:a :b :c])
#{:a :c :b}
```

#### Maps

The last collection on our tour is the map: a data structure which associates
keys with values. In a dictionary, the keys are words and the definitions are
the values. In a library, keys are call signs, and the books are values. Maps
are indexes for looking things up, and for representing different pieces of
named information together. Here’s a cat:

```clojure
user=> {:name "mittens" :weight 9 :color "black"}
{:weight 9, :name "mittens", :color "black"}
```

Maps are surrounded by braces {...}, filled by alternating keys and values. In
this map, the three keys are :name, :color, and :weight, and their values are
"mittens", "black", and 9, respectively. We can look up the corresponding value
for a key with get:

```clojure
user=> (get {"cat" "meow" "dog" "woof"} "cat")
"meow"
user=> (get {:a 1 :b 2} :c)
nil
```

get can also take a default value to return instead of nil, if the key doesn’t
exist in that map.

```clojure
user=> (get {:glinda :good} :wicked :not-here)
:not-here
```

Since lookups are so important for maps, we can use a map as a verb directly:

```clojure
user=> ({"amlodipine" 12 "ibuprofen" 50} "ibuprofen")
50
```

And conversely, keywords can also be used as verbs, which look themselves up in maps:

```clojure
user=> (:raccoon {:weasel "queen" :raccoon "king"})
"king"
```

You can add a value for a given key to a map with assoc.

```clojure
user=> (assoc {:bolts 1088} :camshafts 3)
{:camshafts 3 :bolts 1088}
user=> (assoc {:camshafts 3} :camshafts 2)
{:camshafts 2}
```

Assoc adds keys if they aren’t present, and replaces values if they’re already
there. If you associate a value onto nil, it creates a new map.

```clojure
user=> (assoc nil 5 2)
{5 2}
```

You can combine maps together using merge, which yields a map containing all
the elements of all given maps, preferring the values from later ones.

```clojure
user=> (merge {:a 1 :b 2} {:b 3 :c 4})
{:c 4, :a 1, :b 3}
```

Finally, to remove a value, use dissoc.

```clojure
user=> (dissoc {:potatoes 5 :mushrooms 2} :mushrooms)
{:potatoes 5}
```

#### Putting it all together

All these collections and types can be combined freely. As software engineers,
we model the world by creating a particular representation of the problem in
the program. Having a rich set of values at our disposal allows us to talk
about complex problems. We might describe a person:

```clojure
{:name "Amelia Earhart"
 :birth 1897
 :death 1939
 :awards {"US"    #{"Distinguished Flying Cross" "National Women's Hall of Fame"}
          "World" #{"Altitude record for Autogyro" "First to cross Atlantic twice"}}}
```

Or a recipe:

```clojure
{:title "Chocolate chip cookies"
 :ingredients {"flour"           [(+ 2 1/4) :cup]
               "baking soda"     [1   :teaspoon]
               "salt"            [1   :teaspoon]
               "butter"          [1   :cup]
               "sugar"           [3/4 :cup]
               "brown sugar"     [3/4 :cup]
               "vanilla"         [1   :teaspoon]
               "eggs"            2
               "chocolate chips" [12  :ounce]}}
```

Or the Gini coefficients of nations, as measured over time:

```
{"Afghanistan" {2008 27.8}
 "Indonesia"   {2008 34.1 2010 35.6 2011 38.1}
 "Uruguay"     {2008 46.3 2009 46.3 2010 45.3}}
```

In Clojure, we compose data structures to form more complex values; to talk
about bigger ideas. We use operations like first, nth, get, and contains? to
extract specific information from these structures, and modify them using conj,
disj, assoc, dissoc, and so on.

We started this chapter with a discussion of types: groups of similar objects
which obey the same rules. We learned that bigints, longs, ints, shorts, and
bytes are all integers, that doubles and floats are approximations to decimal
numbers, and that ratios represent fractions exactly. We learned the
differences between strings for text, symbols as references, and keywords as
short labels. Finally, we learned how to compose, alter, and inspect
collections of elements. Armed with the basic nouns of Clojure, we’re ready to
write a broad array of programs.

I’d like to conclude this tour with one last type of value. We’ve inspected
dozens of types so far–but what what happens when you turn the camera on
itself?

```clojure
user=> (type type)
clojure.core$type
```

What is this type thing, exactly? What are these verbs we’ve been learning, and
where do they come from? This is the central question of chapter three:
functions.

### Functions

We left off last chapter with a question: what are verbs, anyway? When you
evaluate (type :mary-poppins), what really happens?

```clojure
user=> (type :mary-poppins)
clojure.lang.Keyword
```

To understand how type works, we’ll need several new ideas. First, we’ll expand
on the notion of symbols as references to other values. Then we’ll learn about
functions: Clojure’s verbs. Finally, we’ll use the Var system to explore and
change the definitions of those functions.

#### Let bindings

We know that symbols are names for things, and that when evaluated, Clojure
replaces those symbols with their corresponding values. +, for instance, is a
symbol which points to the verb #<core$_PLUS_ clojure.core$_PLUS_@12992c>.

```clojure
user=> +
#<core$_PLUS_ clojure.core$_PLUS_@12992c>
```

When you try to use a symbol which has no defined meaning, Clojure refuses:

```clojure
user=> cats

CompilerException java.lang.RuntimeException: Unable to resolve symbol: cats in this context, compiling:(NO_SOURCE_PATH:0:0)
But we can define a meaning for a symbol within a specific expression, using let.

user=> (let [cats 5] (str "I have " cats " cats."))
"I have 5 cats."
```

The let expression first takes a vector of bindings: alternating symbols and
values that those symbols are bound to, within the remainder of the expression.
“Let the symbol cats be 5, and construct a string composed of "I have ", cats,
and " cats".

Let bindings apply only within the let expression itself. They also override
any existing definitions for symbols at that point in the program. For
instance, we can redefine addition to mean subtraction, for the duration of a
let:

```clojure
user=> (let [+ -] (+ 2 3))
-1
```

But that definition doesn’t apply outside the let:

```clojure
user=> (+ 2 3)
5
```

We can also provide multiple bindings. Since Clojure doesn’t care about
spacing, alignment, or newlines, I’ll write this on multiple lines for clarity.

```clojure
user=> (let [person   "joseph"
             num-cats 186]
         (str person " has " num-cats " cats!"))
"joseph has 186 cats!"
```

When multiple bindings are given, they are evaluated in order. Later bindings can use previous bindings.

```clojure
user=> (let [cats 3
             legs (* 4 cats)]
         (str legs " legs all together"))
"12 legs all together"
```

So fundamentally, let defines the meaning of symbols within an expression. When
Clojure evaluates a let, it replaces all occurrences of those symbols in the
rest of the let expression with their corresponding values, then evaluates the
rest of the expression.

#### Functions

We saw in chapter one that Clojure evaluates lists by substituting some other
value in their place:

```clojure
user=> (inc 1)
2
```

inc takes any number, and is replaced by that number plus one. That sounds an
awful lot like a let:

```clojure
user=> (let [x 1] (+ x 1))
2
```

If we bound x to 5 instead of 1, this expression would evaluate to 6. We can
think about inc like a let expression, but without particular values provided
for the symbols.

```clojure
(let [x] (+ x 1))
```

We can’t actually evaluate this program, because there’s no value for x yet. It
could be 1, or 4, or 1453. We say that x is unbound, because it has no binding
to a particular value. This is the nature of the function: an expression with
unbound symbols.

```clojure
user=> (fn [x] (+ x 1))
#<user$eval293$fn__294 user$eval293$fn__294@663fc37>
```

Does the name of that function remind you of anything?

```clojure
user=> inc
#<core$inc clojure.core$inc@16bc0b3c>
```

Almost all verbs in Clojure are functions. Functions represent unrealized
computation: expressions which are not yet evaluated, or incomplete. This
particular function works just like inc: it’s an expression which has a single
unbound symbol, x. When we invoke the function with a particular value, the
expressions in the function are evaluated with x bound to that value.

```clojure
user=> (inc 2)
3
user=> ((fn [x] (+ x 1)) 2)
3
```

We say that x is this function’s argument, or parameter. When Clojure evaluates
(inc 2), we say that inc is called with 2, or that 2 is passed to inc. The
result of that function invocation is the function’s return value. We say that
(inc 2) returns 3.

Fundamentally, functions describe the relationship between arguments and return
values: given 1, return 2. Given 2, return 3, and so on. Let bindings describe
a similar relationship, but with a specific set of values for those arguments.
let is evaluated immediately, whereas fn is evaluated later, when bindings are
provided.

There’s a shorthand for writing functions, too: #(+ % 1) is equivalent to (fn
[x] (+ x 1)). % takes the place of the first argument to the function. You’ll
sometime see %1, %2, etc. used for the first argument, second argument, and so
on.

```clojure
user=> (let [burrito #(list "beans" % "cheese")]
         (burrito "carnitas"))
("beans" "carnitas" "cheese")
```

Since functions exist to defer evaluation, there’s no sense in creating and
invoking them in the same expression as we’ve done here. What we want is to
give names to our functions, so they can be recombined in different ways.

```clojure
user=> (let [twice (fn [x] (* 2 x))]
         (+ (twice 1)
            (twice 3)))
8
```

Compare that expression to an equivalent, expanded form:

```clojure
user=> (+ (* 2 1)
          (* 2 3))
```

The name twice is gone, and in its place is the same sort of computation–(* 2
something)–written twice. While we could represent our programs as a single
massive expression, it’d be impossible to reason about. Instead, we use
functions to compact redundant expressions, by isolating common patterns of
computation. Symbols help us re-use those functions (and other values) in more
than one place. By giving the symbols meaningful names, we make it easier to
reason about the structure of the program as a whole; breaking it up into
smaller, understandable parts.

This is core pursuit of software engineering: organizing expressions. Almost
every programming language is in search of the right tools to break apart,
name, and recombine expressions to solve large problems. In Clojure we’ll see
one particular set of tools for composing programs, but the underlying ideas
will transfer to many other languages.

#### Vars

We’ve used let to define a symbol within an expression, but what about the
default meanings of +, conj, and type? Are they also let bindings? Is the whole
universe one giant let?

Well, not exactly. That’s one way to think about default bindings, but it’s
brittle. We’d need to wrap our whole program in a new let expression every time
we wanted to change the meaning of a symbol. And moreover, once a let is
defined, there’s no way to change it. If we want to redefine symbols for
everyone–even code that we didn’t write–we need a new construct: a mutable
variable.

```clojure
user=> (def cats 5)
#'user/cats
user=> (type #'user/cats)
clojure.lang.Var
````

def defines a type of value we haven’t seen before: a var. Vars, like symbols,
are references to other values. When evaluated, a symbol pointing to a var is
replaced by the var’s corresponding value:

```clojure
user=> user/cats
5
```

def also binds the symbol cats (and its globally qualified equivalent
user/cats) to that var.

```clojure
user=> user/cats
5
user=> cats
5
```

When we said in chapter one that inc, list, and friends were symbols that
pointed to functions, that wasn’t the whole story. The symbol inc points to the
var #'inc, which in turn points to the function #<core$inc
clojure.core$inc@16bc0b3c>. We can see the intermediate var with resolve:

```clojure
user=> 'inc
inc ; the symbol
user=> (resolve 'inc)
#'clojure.core/inc ; the var
user=> (eval 'inc)
#<core$inc clojure.core$inc@16bc0b3c> ; the value
```

Why two layers of indirection? Because unlike the symbol, we can change the
meaning of a Var for everyone, globally, at any time.

```clojure
user=> (def astronauts [])
#'user/astronauts
user=> (count astronauts)
0
user=> (def astronauts ["Sally Ride" "Guy Bluford"])
#'user/astronauts
user=> (count astronauts)
2
```

Notice that astronauts had two distinct meanings, depending on when we
evaluated it. After the first def, astronauts was an empty vector. After the
second def, it had one entry.

If this seems dangerous, you’re a smart cookie. Redefining names in this way
changes the meaning of expressions everywhere in a program, without warning.
Expressions which relied on the value of a Var could suddenly take on new,
possibly incorrect, meanings. It’s a powerful tool for experimenting at the
REPL, and for updating a running program, but it can have unexpected
consequences. Good Clojurists use def to set up a program initially, and only
change those definitions with careful thought.

Totally redefining a Var isn’t the only option. There are safer, controlled
ways to change the meaning of a Var within a particular part of a program,
which we’ll explore later.

#### Defining functions

Armed with def, we’re ready to create our own named functions in Clojure.

```clojure
user=> (def half (fn [number] (/ number 2)))
#'user/half
user=> (half 6)
3
```

Creating a function and binding it to a var is so common that it has its own
form: defn, short for def fn.

```clojure
user=> (defn half [number] (/ number 2))
#'user/half
```

Functions don’t have to take an argument. We’ve seen functions which take zero
arguments, like (+).

```clojure
user=> (defn half [] 1/2)
#'user/half
user=> (half)
1/2
```

But if we try to use our earlier form with one argument, Clojure complains that
the arity–the number of arguments to the function–is incorrect.

```clojure
user=> (half 10)

ArityException Wrong number of args (1) passed to: user$half  clojure.lang.AFn.throwArity (AFn.java:437)
```

To handle multiple arities, functions have an alternate form. Instead of an
argument vector and a body, one provides a series of lists, each of which
starts with an argument vector, followed by the body.

```clojure
user=> (defn half
         ([]  1/2)
         ([x] (/ x 2)))
user=> (half)
1/2
user=> (half 10)
5
```

Multiple arguments work just like you expect. Just specify an argument vector
of two, or three, or however many arguments the function takes.

```clojure
user=> (defn add
         [x y]
         (+ x y))
#'user/add
user=> (add 1 2)
3
```

Some functions can take any number of arguments. For that, Clojure provides &,
which slurps up all remaining arguments as a list:

```clojure
user=> (defn vargs
         [x y & more-args]
         {:x    x
          :y    y
          :more more-args})
#'user/vargs
user=> (vargs 1)

ArityException Wrong number of args (1) passed to: user$vargs  clojure.lang.AFn.throwArity (AFn.java:437)
user=> (vargs 1 2)
{:x 1, :y 2, :more nil}
user=> (vargs 1 2 3 4 5)
{:x 1, :y 2, :more (3 4 5)}
```

Note that x and y are mandatory, though there don’t have to be any remaining
arguments.

To keep track of what arguments a function takes, why the function exists, and
what it does, we usually include a docstring. Docstrings help fill in the
missing context around functions, to explain their assumptions, context, and
purpose to the world.

```clojure
(defn launch
  "Launches a spacecraft into the given orbit by initiating a
   controlled on-axis burn. Does not automatically stage, but
   does vector thrust, if the craft supports it."
  [craft target-orbit]
  "OK, we don't know how to control spacecraft yet.")
```

Docstrings are used to automatically generate documentation for Clojure
programs, but you can also access them from the REPL.

```clojure
user=> (doc launch)
-------------------------
user/launch
([craft target-orbit])
   Launches a spacecraft into the given orbit by initiating a
   controlled on-axis burn. Does not automatically stage, but
   does vector thrust, if the craft supports it.
nil
```

doc tells us the full name of the function, the arguments it accepts, and its
docstring. This information comes from the #'launch var’s metadata, and is
saved there by defn. We can inspect metadata directly with the meta function:

```clojure
(meta #'launch)
{:arglists ([craft target-orbit]), :ns #<Namespace user>, :name launch, :column 1, :doc "Launches a spacecraft into the given orbit.", :line 1, :file "NO_SOURCE_PATH"}
There’s some other juicy information in there, like the file the function was defined in and which line and column it started at, but that’s not particularly useful since we’re in the REPL, not a file. However, this does hint at a way to answer our motivating question: how does the type function work?
```

#### How does type work?

We know that type returns the type of an object:

```clojure
user=> (type 2)
java.lang.long
```

And that type, like all functions, is a kind of object with its own unique type:

````clojure
user=> type
#<core$type clojure.core$type@39bda9b9>
user=> (type type)
clojure.core$type
```

This tells us that type is a particular instance, at memory address 39bda9b9,
of the type clojure.core$type. clojure.core is a namespace which defines the
fundamentals of the Clojure language, and $type tells us that it’s named type
in that namespace. None of this is particularly helpful, though. Maybe we can
find out more about the clojure.core$type by asking what its supertypes are:

```clojure
user=> (supers (type type))
#{clojure.lang.AFunction clojure.lang.IMeta java.util.concurrent.Callable clojure.lang.Fn clojure.lang.AFn java.util.Comparator java.lang.Object clojure.lang.RestFn clojure.lang.IObj java.lang.Runnable java.io.Serializable clojure.lang.IFn}
```

This is a set of all the types that include type. We say that type is an
instance of clojure.lang.AFunction, or that it implements or extends
java.util.concurrent.Callable, and so on. Since it’s a member of
clojure.lang.IMeta it has metadata, and since it’s a member of
clojure.lang.AFn, it’s a function. Just to double check, let’s confirm that
type is indeed a function:

```clojure
user=> (fn? type)
true
```

What about its documentation?

```clojure
user=> (doc type)
-------------------------
clojure.core/type
([x])
  Returns the :type metadata of x, or its Class if none
nil
```

Ah, that’s helpful. type can take a single argument, which it calls x. If it
has :type metadata, that’s what it returns. Otherwise, it returns the class of
x. Let’s take a deeper look at type‘s metadata for more clues.

```clojure
user=> (meta #'type)
{:ns #<Namespace clojure.core>, :name type, :arglists ([x]), :column 1, :added "1.0", :static true, :doc "Returns the :type metadata of x, or its Class if none", :line 3109, :file "clojure/core.clj"}
````

Look at that! This function was first added to Clojure in version 1.0, and is
defined in the file clojure/core.clj, on line 3109. We could go dig up the
Clojure source code and read its definition there–or we could ask Clojure to do
it for us:

```clojure
user=> (source type)
(defn type 
  "Returns the :type metadata of x, or its Class if none"
  {:added "1.0"
   :static true}
  [x]
  (or (get (meta x) :type) (class x)))
nil
```

Aha! Here, at last, is how type works. It’s a function which takes a single
argument x, and returns either :type from its metadata, or (class x).

We can delve into any function in Clojure using these tools:

```clojure
user=> (source +)
(defn +
  "Returns the sum of nums. (+) returns 0. Does not auto-promote
  longs, will throw on overflow. See also: +'"
  {:inline (nary-inline 'add 'unchecked_add)
   :inline-arities >1?
   :added "1.2"}
  ([] 0)
  ([x] (cast Number x))
  ([x y] (. clojure.lang.Numbers (add x y)))
  ([x y & more]
     (reduce1 + (+ x y) more)))
nil
```

Almost every function in a programming language is made up of other, simpler
functions. +, for instance, is defined in terms of cast, add, and reduce1.
Sometimes functions are defined in terms of themselves. + uses itself twice in
this definition; a technique called recursion.

At the bottom, though, are certain fundamental constructs below which you can
go no further. Core axioms of the language. Lisp calls these "special forms”.
def and let are special forms (well–almost: let is a thin wrapper around let*,
which is a special form) in Clojure. These forms are defined by the core
implementation of the language, and are not reducible to other Clojure
expressions.

```clojure
user=> (source def)
Source not found
```

Some Lisps are written entirely in terms of a few special forms, but Clojure is
much less pure. Many functions bottom out in Java functions and types, or, for
CLJS, in terms of Javascript. Any time you see an expression like (.
clojure.lang.Numbers (add x y)), there’s Java code underneath. Below Java lies
the JVM, which might be written in C or C++, depending on which one you use.
And underneath C and C++ lie more libraries, the operating system, assembler,
microcode, registers, and ultimately, electrons flowing through silicon.

A well-designed language isolates you from details you don’t need to worry
about, like which logic gates or registers to use, and lets you focus on the
task at hand. Good languages also need to allow escape hatches for performance
or access to dangerous functionality, as we saw with Vars. You can write entire
programs entirely in terms of Clojure, but sometimes, for performance or to use
tools from other languages, you’ll rely on Java. The Clojure code is easy to
explore with doc and source, but Java can be more opaque–I usually rely on the
java source files and online documentation.

#### Review

We’ve seen how let associates names with values in a particular expression, and
how Vars allow for mutable bindings which apply universally. and whose
definitions can change over time. We learned that Clojure verbs are functions,
which express the general shape of an expression but with certain values
unbound. Invoking a function binds those variables to specific values, allowing
evaluation of the function to proceed.

Functions decompose programs into simpler pieces, expressed in terms of one
another. Short, meaningful names help us understand what those functions (and
other values) mean.

Finally, we learned how to introspect Clojure functions with doc and source,
and saw the definition of some basic Clojure functions. The Clojure cheatsheet
gives a comprehensive list of the core functions in the language, and is a
great starting point when you have to solve a problem but don’t know what
functions to use.

We’ll see a broad swath of those functions in Chapter 4: Sequences.

*My thanks to Zach Tellman, Kelly Sommers, and Michael R Bernstein for reviewing
drafts of this chapter.*

### Sequences

In Chapter 3, we discovered functions as a way to abstract expressions; to
rephrase a particular computation with some parts missing. We used functions to
transform a single value. But what if we want to apply a function to more than
one value at once?

#### What about sequences?

For example, we know that (inc 2) increments the number 2. What if we wanted to
increment every number in the vector [1 2 3], producing [2 3 4]?

```clojure
user=> (inc [1 2 3])
ClassCastException clojure.lang.PersistentVector cannot be cast to java.lang.Number  clojure.lang.Numbers.inc (Numbers.java:110)
```

Clearly inc can only work on numbers, not on vectors. We need a different kind
of tool.

#### A direct approach

Let’s think about the problem in concrete terms. We want to increment each of
three elements: the first, second, and third. We know how to get an element
from a sequence by using nth, so let’s start with the first number, at index 0:

```clojure
user=> (def numbers [1 2 3])
#'user/numbers
user=> (nth numbers 0)
1
user=> (inc (nth numbers 0))
2
```

So there’s the first element incremented. Now we can do the second:

```clojure
user=> (inc (nth numbers 1))
3
user=> (inc (nth numbers 2))
4
```

And it should be straightforward to combine these into a vector…

```clojure
user=> [(inc (nth numbers 0)) (inc (nth numbers 1)) (inc (nth numbers 2))]
[2 3 4]
```

Success! We’ve incremented each of the numbers in the list! How about a list
with only two elements?

```clojure
user=> (def numbers [1 2])
#'user/numbers
user=> [(inc (nth numbers 0)) (inc (nth numbers 1)) (inc (nth numbers 2))]

IndexOutOfBoundsException   clojure.lang.PersistentVector.arrayFor (PersistentVector.java:107)
```

Shoot. We tried to get the element at index 2, but couldn’t, because numbers
only has indices 0 and 1. Clojure calls that “index out of bounds”.

We could just leave off the third expression in the vector; taking only
elements 0 and 1. But the problem actually gets much worse, because we’d need
to make this change every time we wanted to use a different sized vector. And
what of a vector with 1000 elements? We’d need 1000 (inc (nth numbers ...))
expressions! Down this path lies madness.

Let’s back up a bit, and try a slightly smaller problem.

#### Recursion

What if we just incremented the first number in the vector? How would that
work? We know that first finds the first element in a sequence, and rest finds
all the remaining ones.

```clojure
user=> (first [1 2 3])
1
user=> (rest [1 2 3])
(2 3)
```

So there’s the pieces we’d need. To glue them back together, we can use a
function called cons, which says “make a list beginning with the first
argument, followed by all the elements in the second argument”.

```clojure
user=> (cons 1 [2])
(1 2)
user=> (cons 1 [2 3])
(1 2 3)
user=> (cons 1 [2 3 4])
(1 2 3 4)
```

OK so we can split up a sequence, increment the first part, and join them back
together. Not so hard, right?

```clojure
(defn inc-first [nums]
  (cons (inc (first nums))
        (rest nums)))
user=> (inc-first [1 2 3 4])
(2 2 3 4)
```

Hey, there we go! First element changed. Will it work with any length list?

```clojure
user=> (inc-first [5])
(6)
user=> (inc-first [])

NullPointerException   clojure.lang.Numbers.ops (Numbers.java:942)
```

Shoot. We can’t increment the first element of this empty vector, because it
doesn’t have a first element.

```clojure
user=> (first [])
nil
user=> (inc nil)

NullPointerException   clojure.lang.Numbers.ops (Numbers.java:942)
```

So there are really two cases for this function. If there is a first element in
nums, we’ll increment it as normal. If there’s no such element, we’ll return an
empty list. To express this kind of conditional behavior, we’ll use a Clojure
special form called if:

```clojure
user=> (doc if)
-------------------------
if
  (if test then else?)
Special Form
  Evaluates test. If not the singular values nil or false,
  evaluates and yields then, otherwise, evaluates and yields else. If
  else is not supplied it defaults to nil.

  Please see http://clojure.org/special_forms#if
```

To confirm our intuition:

```clojure
user=> (if true :a :b)
:a
user=> (if false :a :b)
:b
```

Seems straightforward enough.

```clojure
(defn inc-first [nums]
  (if (first nums)
    ; If there's a first number, build a new list with cons
    (cons (inc (first nums))
          (rest nums))
    ; If there's no first number, just return an empty list
    (list)))

user=> (inc-first [])
()
user=> (inc-first [1 2 3])
(2 2 3)
```

Success! Now we can handle both cases: empty sequences, and sequences with
things in them. Now how about incrementing that second number? Let’s stare at
that code for a bit.

```clojure
(rest nums)
```

Hang on. That list–(rest nums)–that’s a list of numbers too. What if we… used
our inc-first function on that list, to increment its first number? Then we’d
have incremented both the first and the second element.

```clojure
(defn inc-more [nums]
  (if (first nums)
    (cons (inc (first nums))
          (inc-more (rest nums)))
    (list)))
user=> (inc-more [1 2 3 4])
(2 3 4 5)
```

Odd. That didn’t just increment the first two numbers. It incremented all the
numbers. We fell into the complete solution entirely by accident. What happened
here?

Well first we… yes, we got the number one, and incremented it. Then we stuck
that onto (inc-first [2 3 4]), which got two, and incremented it. Then we stuck
that two onto (inc-first [3 4]), which got three, and then we did the same for
four. Only that time around, at the very end of the list, (rest [4]) would have
been empty. So when we went to get the first number of the empty list, we took
the second branch of the if, and returned the empty list.

Having reached the bottom of the function calls, so to speak, we zip back up
the chain. We can imagine this function turning into a long string of cons
calls, like so:

```clojure
(cons 2 (cons 3 (cons 4 (cons 5 '()))))
(cons 2 (cons 3 (cons 4 '(5))))
(cons 2 (cons 3 '(4 5)))
(cons 2 '(3 4 5))
'(2 3 4 5)
```

This technique is called recursion, and it is a fundamental principle in
working with collections, sequences, trees, or graphs… any problem which has
small parts linked together. There are two key elements in a recursive program:

1. Some part of the problem which has a known solution
2. A relationship which connects one part of the problem to the next

Incrementing the elements of an empty list returns the empty list. This is our
base case: the ground to build on. Our inductive case, also called the
recurrence relation, is how we broke the problem up into incrementing the first
number in the sequence, and incrementing all the numbers in the rest of the
sequence. The if expression bound these two cases together into a single
function; a function defined in terms of itself.

Once the initial step has been taken, every step can be taken.

```clojure
user=> (inc-more [1 2 3 4 5 6 7 8 9 10 11 12])
(2 3 4 5 6 7 8 9 10 11 12 13)
```

This is the beauty of a recursive function; folding an unbounded stream of
computation over and over, onto itself, until only a single step remains.

#### Generalizing from inc

We set out to increment every number in a vector, but nothing in our solution
actually depended on inc. It just as well could have been dec, or str, or
keyword. Let’s parameterize our inc-more function to use any transformation of
its elements:

```clojure
(defn transform-all [f xs]
  (if (first xs)
    (cons (f (first xs))
          (transform-all f (rest xs)))
    (list)))
```

Because we could be talking about any kind of sequence, not just numbers, we’ve
named the sequence xs, and its first element x. We also take a function f as an
argument, and that function will be applied to each x in turn. So not only can
we increment numbers…

```clojure
user=> (transform-all inc [1 2 3 4])
(2 3 4 5)
```

…but we can turn strings to keywords…

```clojure
user=> (transform-all keyword ["bell" "hooks"])
(:bell :hooks)
…or wrap every element in a list:

user=> (transform-all list [:codex :book :manuscript])
((:codex) (:book) (:manuscript))
```

In short, this function expresses a sequence in which each element is some
function applied to the corresponding element in the underlying sequence. This
idea is so important that it has its own name, in mathematics, Clojure, and
other languages. We call it map.

```clojure
user=> (map inc [1 2 3 4])
(2 3 4 5)
```

You might remember maps as a datatype in Clojure, too–they’re dictionaries that
relate keys to values.

```clojure
{:year  1969
 :event "moon landing"}
```

The function map relates one sequence to another. The type map relates keys to
values. There is a deep symmetry between the two: maps are usually sparse, and
the relationships between keys and values may be arbitrarily complex. The map
function, on the other hand, usually expresses the same type of relationship,
applied to a series of elements in fixed order.

#### Building sequences

Recursion can do more than just map. We can use it to expand a single value
into a sequence of values, each related by some function. For instance:

```clojure
(defn expand [f x count]
  (if (pos? count)
    (cons x (expand f (f x) (dec count)))))
```

Our base case is x itself, followed by the sequence beginning with (f x). That
sequence in turn expands to (f (f x)), and then (f (f (f x))), and so on. Each
time we call expand, we count down by one using dec. Once the count is zero,
the if returns nil, and evaluation stops. If we start with the number 0 and use
inc as our function:

```clojure
user=> user=> (expand inc 0 10)
(0 1 2 3 4 5 6 7 8 9)
```

Clojure has a more general form of this function, called iterate.

```clojure
user=> (take 10 (iterate inc 0))
(0 1 2 3 4 5 6 7 8 9)
```

Since this sequence is infinitely long, we’re using take to select only the
first 10 elements. We can construct more complex sequences by using more
complex functions:

```clojure
user=> (take 10 (iterate (fn [x] (if (odd? x) (+ 1 x) (/ x 2))) 10))
(10 5 6 3 4 2 1 2 1 2)
```

Or build up strings:

```clojure
user=> (take 5 (iterate (fn [x] (str x "o")) "y"))
("y" "yo" "yoo" "yooo" "yoooo")
```

iterate is extremely handy for working with infinite sequences, and has some
partners in crime. repeat, for instance, constructs a sequence where every
element is the same.

```clojure
user=> (take 10 (repeat :hi))
(:hi :hi :hi :hi :hi :hi :hi :hi :hi :hi)
user=> (repeat 3 :echo)
(:echo :echo :echo)
```

And its close relative repeatedly simply calls a function (f) to generate an
infinite sequence of values, over and over again, without any relationship
between elements. For an infinite sequence of random numbers:

```clojure
user=> (rand)
0.9002678382322784
user=> (rand)
0.12375594203332863
user=> (take 3 (repeatedly rand))
(0.44442397843046755 0.33668691162169784 0.18244875487846746)
```

Notice that calling (rand) returns a different number each time. We say that
rand is an impure function, because it cannot simply be replaced by the same
value every time. It does something different each time it’s called.

There’s another very handy sequence function specifically for numbers: range,
which generates a sequence of numbers between two points. (range n) gives n
successive integers starting at 0. (range n m) returns integers from n to m-1.
(range n m step) returns integers from n to m, but separated by step.

```clojure
user=> (range 5)
(0 1 2 3 4)
user=> (range 2 10)
(2 3 4 5 6 7 8 9)
user=> (range 0 100 5)
(0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95)
```

To extend a sequence by repeating it forever, use cycle:

```clojure
user=> (take 10 (cycle [1 2 3]))
(1 2 3 1 2 3 1 2 3 1)
```

#### Transforming sequences

Given a sequence, we often want to find a related sequence. map, for instance,
applies a function to each element–but has a few more tricks up its sleeve.

```clojure
user=> (map (fn [n vehicle] (str "I've got " n " " vehicle "s"))
         [0 200 9]
         ["car" "train" "kiteboard"])

("I've got 0 cars" "I've got 200 trains" "I've got 9 kiteboards")
```

If given multiple sequences, map calls its function with one element from each
sequence in turn. So the first value will be (f 0 "car"), the second (f 200
"train"), and so on. Like a zipper, map folds together corresponding elements
from multiple collections. To sum three vectors, column-wise:

```clojure
user=> (map + [1 2 3]
              [4 5 6]
              [7 8 9])
(12 15 18)
```

If one sequence is bigger than another, map stops at the end of the smaller
one. We can exploit this to combine finite and infinite sequences. For example,
to number the elements in a vector:

```clojure
user=> (map (fn [index element] (str index ". " element))
            (iterate inc 0)
            ["erlang" "ruby" "haskell"])
("0. erlang" "1. ruby" "2. haskell")
```

Transforming elements together with their indices is so common that Clojure has
a special function for it: map-indexed:

```clojure
user=> (map-indexed (fn [index element] (str index ". " element))
                    ["erlang" "ruby" "haskell"])
("0. erlang" "1. ruby" "2. haskell")
```

You can also tack one sequence onto the end of another, like so:

```clojure
user=> (concat [1 2 3] [:a :b :c] [4 5 6])
(1 2 3 :a :b :c 4 5 6)
```

Another way to combine two sequences is to riffle them together, using
interleave.

```clojure
user=> (interleave [:a :b :c] [1 2 3])
(:a 1 :b 2 :c 3)
```

And if you want to insert a specific element between each successive pair in a
sequence, try interpose:

```clojure
user=> (interpose :and [1 2 3 4])
(1 :and 2 :and 3 :and 4)
```

To reverse a sequence, use reverse.

```clojure
user=> (reverse [1 2 3])
(3 2 1)
user=> (reverse "woolf")
(\f \l \o \o \w)
```

Strings are sequences too! Each element of a string is a character, written \f.
You can rejoin those characters into a string with apply str:

```clojure
user=> (apply str (reverse "woolf"))
"floow"
…and break strings up into sequences of chars with seq.

user=> (seq "sato")
(\s \a \t \o)
```

To randomize the order of a sequence, use shuffle.

```clojure
user=> (shuffle [1 2 3 4])
[3 1 2 4]
user=> (apply str (shuffle (seq "abracadabra")))
"acaadabrrab"
```

#### Subsequences

We’ve already seen take, which selects the first n elements. There’s also drop,
which removes the first n elements.

```clojure
user=> (range 10)
(0 1 2 3 4 5 6 7 8 9)
user=> (take 3 (range 10))
(0 1 2)
user=> (drop 3 (range 10))
(3 4 5 6 7 8 9)
```

And for slicing apart the other end of the sequence, we have take-last and
drop-last:

```clojure
user=> (take-last 3 (range 10))
(7 8 9)
user=> (drop-last 3 (range 10))
(0 1 2 3 4 5 6)
```

take-while and drop-while work just like take and drop, but use a function to
decide when to cut.

```clojure
user=> (take-while pos? [3 2 1 0 -1 -2 10])
(3 2 1)
```

In general, one can cut a sequence in twain by using split-at, and giving it a
particular index. There’s also split-with, which uses a function to decide when
to cut.

```clojure
(split-at 4 (range 10))
[(0 1 2 3) (4 5 6 7 8 9)]
user=> (split-with number? [1 2 3 :mark 4 5 6 :mark 7])
[(1 2 3) (:mark 4 5 6 :mark 7)]
```

Notice that because indexes start at zero, sequence functions tend to have
predictable numbers of elements. (split-at 4) yields four elements in the first
collection, and ensures the second collection begins at index four. (range 10)
has ten elements, corresponding to the first ten indices in a sequence. (range
3 5) has two (since 5 - 3 is two) elements. These choices simplify the
definition of recursive functions as well.

We can select particular elements from a sequence by applying a function. To
find all positive numbers in a list, use filter:

```clojure
user=> (filter pos? [1 5 -4 -7 3 0])
(1 5 3)
```

filter looks at each element in turn, and includes it in the resulting sequence
only if (f element) returns a truthy value. Its complement is remove, which
only includes those elements where (f element) is false or nil.

```clojure
user=> (remove string? [1 "turing" :apple])
(1 :apple)
```

Finally, one can group a sequence into chunks using partition, partition-all,
or partition-by. For instance, one might group alternating values into pairs:

```clojure
user=> (partition 2 [:cats 5 :bats 27 :crocodiles 0])
((:cats 5) (:bats 27) (:crocodiles 0))
```

Or separate a series of numbers into negative and positive runs:

```clojure
(user=> (partition-by neg? [1 2 3 2 1 -1 -2 -3 -2 -1 1 2])
((1 2 3 2 1) (-1 -2 -3 -2 -1) (1 2))
```

#### Collapsing sequences

After transforming a sequence, we often want to collapse it in some way; to
derive some smaller value. For instance, we might want the number of times each
element appears in a sequence:

```clojure
user=> (frequencies [:meow :mrrrow :meow :meow])
{:meow 3, :mrrrow 1}
```

Or to group elements by some function:

```clojure
user=> (pprint (group-by :first [{:first "Li"    :last "Zhou"}
                                 {:first "Sarah" :last "Lee"}
                                 {:first "Sarah" :last "Dunn"}
                                 {:first "Li"    :last "O'Toole"}]))
{"Li"    [{:last "Zhou", :first "Li"}   {:last "O'Toole", :first "Li"}],
 "Sarah" [{:last "Lee", :first "Sarah"} {:last "Dunn", :first "Sarah"}]}
```

Here we’ve taken a sequence of people with first and last names, and used the
:first keyword (which can act as a function!) to look up those first names.
group-by used that function to produce a map of first names to lists of
people–kind of like an index.

In general, we want to combine elements together in some way, using a function.
Where map treated each element independently, reducing a sequence requires that
we bring some information along. The most general way to collapse a sequence is
reduce.

```clojure
user=> (doc reduce)
-------------------------
clojure.core/reduce
([f coll] [f val coll])
  f should be a function of 2 arguments. If val is not supplied,
  returns the result of applying f to the first 2 items in coll, then
  applying f to that result and the 3rd item, etc. If coll contains no
  items, f must accept no arguments as well, and reduce returns the
  result of calling f with no arguments.  If coll has only 1 item, it
  is returned and f is not called.  If val is supplied, returns the
  result of applying f to val and the first item in coll, then
  applying f to that result and the 2nd item, etc. If coll contains no
  items, returns val and f is not called.
```

That’s a little complicated, so we’ll start small. We need a function, f, which
combines successive elements of the sequence. (f state element) will return the
state for the next invocation of f. As f moves along the sequence, it carries
some changing state with it. The final state is the return value of reduce.

```clojure
user=> (reduce + [1 2 3 4])
10
```

reduce begins by calling (+ 1 2), which yields the state 3. Then it calls (+ 3
3), which yields 6. Then (+ 6 4), which returns 10. We’ve taken a function over
two elements, and used it to combine all the elements. Mathematically, we could
write:

```clojure
1 + 2 + 3 + 4
    3 + 3 + 4
        6 + 4
           10
```

So another way to look at reduce is like sticking a function between each pair
of elements. To see the reducing process in action, we can use reductions,
which returns a sequence of all the intermediate states.

```clojure
user=> (reductions + [1 2 3 4])
(1 3 6 10)
```

Oftentimes we include a default state to start with. For instance, we could
start with an empty set, and add each element to it as we go along:

```clojure
user=> (reduce conj #{} [:a :b :b :b :a :a])
#{:a :b}
```

Reducing elements into a collection has its own name: into. We can conj [key
value] vectors into a map, for instance, or build up a list:

```clojure
user=> (into {} [[:a 2] [:b 3]])
{:a 2, :b 3}
user=> (into (list) [1 2 3 4])
(4 3 2 1)
```

Because elements added to a list appear at the beginning, not the end, this
expression reverses the sequence. Vectors conj onto the end, so to emit the
elements in order, using reduce, we might try:

```clojure
user=> (reduce conj [] [1 2 3 4 5])
(reduce conj [] [1 2 3 4 5])
[1 2 3 4 5]
```

Which brings up an interesting thought: this looks an awful lot like map. All
that’s missing is some kind of transformation applied to each element.

```clojure
(defn my-map [f coll]
  (reduce (fn [output element]
            (conj output (f element)))
          []
          coll))
user=> (my-map inc [1 2 3 4])
[2 3 4 5]
```

Huh. map is just a special kind of reduce. What about, say, take-while?

```clojure
(defn my-take-while [f coll]
  (reduce (fn [out elem]
            (if (f elem)
              (conj out elem)
              (reduced out)))
          []
          coll))
```

We’re using a special function here, reduced, to indicate that we’ve completed
our reduction early and can skip the rest of the sequence.

```clojure
user=> (my-take-while pos? [2 1 0 -1 0 1 2])
[2 1]
```

reduce really is the uberfunction over sequences. Almost any operation on a
sequence can be expressed in terms of a reduce–though for various reasons, many
of the Clojure sequence functions are not written this way. For instance,
take-while is actually defined like so:

```clojure
user=> (source take-while)
(defn take-while
  "Returns a lazy sequence of successive items from coll while
  (pred item) returns true. pred must be free of side-effects."
  {:added "1.0"
   :static true}
  [pred coll]
  (lazy-seq
   (when-let [s (seq coll)]
       (when (pred (first s))
         (cons (first s) (take-while pred (rest s)))))))
```

There’s a few new pieces here, but the structure is essentially the same as our
initial attempt at writing map. When the predicate matches the first element,
cons the first element onto take-while, applied to the rest of the sequence.
That lazy-seq construct allows Clojure to compute this sequence as required,
instead of right away. It defers execution to a later time.

Most of Clojure’s sequence functions are lazy. They don’t do anything until
needed. For instance, we can increment every number from zero to infinity:

```clojure
user=> (def infseq (map inc (iterate inc 0)))
#'user/infseq
user=> (realized? infseq)
false
```

That function returned immediately. Because it hasn’t done any work yet, we say
the sequence is unrealized. It doesn’t increment any numbers at all until we
ask for them:

```clojure
user=> (take 10 infseq)
(1 2 3 4 5 6 7 8 9 10)
user=> (realized? infseq)
true
```

Lazy sequences also remember their contents, once evaluated, for faster access.

#### Putting it all together

We’ve seen how recursion generalizes a function over one thing into a function
over many things, and discovered a rich landscape of recursive functions over
sequences. Now let’s use our knowledge of sequences to solve a more complex
problem: find the sum of the products of consecutive pairs of the first 1000
odd integers.

First, we’ll need the integers. We can start with 0, and work our way up to
infinity. To save time printing an infinite number of integers, we’ll start
with just the first 10.

```clojure
user=> (take 10 (iterate inc 0))
(0 1 2 3 4 5 6 7 8 9)
```

Now we need to find only the ones which are odd. Remember, filter pares down a
sequence to only those elements which pass a test.

```clojure
user=> (take 10 (filter odd? (iterate inc 0)))
(1 3 5 7 9 11 13 15 17 19)
```

For consecutive pairs, we want to take [1 3 5 7 ...] and find a sequence like
([1 3] [3 5] [5 7] ...). That sounds like a job for partition:

```clojure
user=> (take 3 (partition 2 (filter odd? (iterate inc 0))))
((1 3) (5 7) (9 11))
```

Not quite right–this gave us non-overlapping pairs, but we wanted overlapping
ones too. A quick check of (doc partition) reveals the step parameter:

```clojure
user=> (take 3 (partition 2 1 (filter odd? (iterate inc 0))))
((1 3) (3 5) (5 7))
```

Now we need to find the product for each pair. Given a pair, multiply the two
pieces together… yes, that sounds like map:

```clojure
user=> (take 3 (map (fn [pair] (* (first pair) (second pair)))
                    (partition 2 1 (filter odd? (iterate inc 0)))))
(3 15 35)
```

Getting a bit unwieldy, isn’t it? Only one final step: sum all those products.
We’ll adjust the take to include the first 1000, not the first 3, elements.

```clojure
user=> (reduce +
               (take 1000
                     (map (fn [pair] (* (first pair) (second pair)))
                          (partition 2 1
                                    (filter odd?
                                            (iterate inc 0)))))
1335333000
```

The sum of the first thousand products of consecutive pairs of the odd integers
starting at 0. See how each part leads to the next? This expression looks a lot
like the way we phrased the problem in English–but both English and Lisp
expressions are sort of backwards, in a way. The part that happens first
appears deepest, last, in the expression. In a chain of reasoning like this,
it’d be nicer to write it in order.

```clojure
user=> (->> 0
            (iterate inc)
            (filter odd?)
            (partition 2 1)
            (map (fn [pair]
                   (* (first pair) (second pair))))
            (take 1000)
            (reduce +))
1335333000
```

Much easier to read: now everything flows in order, from top to bottom, and
we’ve flattened out the deeply nested expressions into a single level. This is
how object-oriented languages structure their expressions: as a chain of
function invocations, each acting on the previous value.

But how is this possible? Which expression gets evaluated first? (take 1000)
isn’t even a valid call–where’s its second argument? How are any of these forms
evaluated?

What kind of arcane function is ->>?

All these mysteries, and more, in Chapter 5: Macros.

#### Problems

1. Write a function to find out if a string is a palindrome–that is, if it looks the same forwards and backwards.
2. Find the number of ‘c’s in “abracadabra”.
3. Write your own version of filter.
4. Find the first 100 prime numbers: 2, 3, 5, 7, 11, 13, 17, ….

### Macros

https://aphyr.com/posts/305-clojure-from-the-ground-up-macros

### State

https://aphyr.com/posts/306-clojure-from-the-ground-up-state

### Logistics

https://aphyr.com/posts/311-clojure-from-the-ground-up-logistics

### Modeling

https://aphyr.com/posts/312-clojure-from-the-ground-up-modeling

### Debugging

Writing software can be an exercise in frustration. Useless error messages,
difficult-to-reproduce bugs, missing stacktrace information, obscure functions
without documentation, and unmaintained libraries all stand in our way. As
software engineers, our most useful skill isn’t so much *knowing how to solve a
problem as knowing how to explore a problem that we haven’t seen before*.
Experience is important, but even experienced engineers face unfamiliar bugs
every day. When a problem doesn’t bear a resemblance to anything we’ve seen
before, we fall back on *general cognitive strategies* to explore–and ultimately
solve–the problem.

There’s an excellent book by the mathematician George Polya: [How to Solve
It](https://www.amazon.com/How-Solve-It-Mathematical-Princeton/dp/069111966X),
which tries to catalogue how successful mathematicians approach unfamiliar
problems. When I catch myself banging my head against a problem for more than a
few minutes, I try to back up and consider his
[principles](http://math.berkeley.edu/~gmelvin/polya.pdf). Sometimes, just
taking the time to slow down and reflect can get me out of a rut.

Understand the problem.

1. Devise a plan.
2. Carry out the plan
3. Look back
4. Seems easy enough, right? Let’s go a little deeper.

#### Understanding the problem

Well *obviously* there’s a problem, right? The program failed to compile, or a
test spat out bizarre numbers, or you hit an unexpected exception. But try to
dig a little deeper than that. Just having a careful description of the problem
can make the solution obvious.

```
Our audit program detected that users can double-withdraw cash from their
accounts.
```

What does your program do? Chances are your program is large and complex, so
try to *isolate* the problem as much as possible. Find *preconditions* where the
error holds.

```
The problem occurs after multiple transfers between accounts.
```

Identify specific lines of code from the stacktrace that are involved, specific
data that’s being passed around. Can you find a particular function that’s
misbehaving?

```
The balance transfer function sometimes doesn’t increase or decrease the
account values correctly.
```

What are that function’s inputs and outputs? Are the inputs what you expected?
What did you expect the result to be, given those arguments? It’s not enough to
know “it doesn’t work” – you need to know exactly what *should* have happened. Try
to find conditions where the function works correctly, so you can map out the
boundaries of the problem.

```
Trying to transfer $100 from A to B works as expected, as does a transfer of
$50 from B to A. Running a million random transfers between accounts,
sequentially, results in correct balances. The problem only seems to happen in
production.
```

If your function–or functions it calls–uses mutable state, like an agent, atom,
or ref, the value of those references matters too. This is why you should avoid
mutable state wherever possible: each mutable variable introduces another
dimension of possible behaviors for your program. Print out those values when
they’re read, and after they’re written, to get a description of what the
function is actually doing. I am a huge believer in sprinkling `(prn x)`
throughout one’s code to print how state evolves when the program runs.

```
Each balance is stored in a separate atom. When two transfers happen at the
same time involving the same accounts, the new value of one or both atoms may
not reflect the transfer correctly.
```

Look for invariants: properties that should always be true of a program. Devise
a test to look for where those invariants are broken. Consider each individual
step of the program: does it preserve all the invariants you need? If it
doesn’t, what ensures those invariants are restored correctly?

```
The total amount of money in the system should be constant–but sometimes changes!
```

Draw diagrams, and invent a notation to talk about the problem. If you’re
accessing fields in a vector, try drawing the vector as a set of boxes, and
drawing the fields it accesses, step by step on paper. If you’re manipulating a
tree, draw one! Figure out a way to write down the state of the system: in
letters, numbers, arrows, graphs, whatever you can dream up.

```
Transferring $5 from A to B in transaction 1, and $5 from B to A in transaction 2:

Transaction  |  A  |  B
-------------+-----+-----
txn1 read    |  10 |  10   ; Transaction 1 sees 10, 10
txn1 write A |   5 |  10   ; A and B now out-of-sync
txn2 read    |   5 |  10   ; Transaction 2 sees 5, 10
txn1 write B |   5 |  15   ; Transaction 1 completes
txn2 write A |  10 |  15   ; Transaction 2 writes based on out-of-sync read
txn2 write B |   5 |  5    ; Should have been 10, 10!
```

This doesn’t *solve* the problem, but helps us *explore* the problem in depth.
Sometimes this makes the solution obvious–other times, we’re just left with a
pile of disjoint facts. Even if things look jumbled-up and confusing, don’t
despair! Exploring gives the brain the pieces; it’ll link them together over
time.

Armed with a detailed *description*	 of the problem, we’re much better equipped to
solve it.

#### Devise a plan

Our brains are excellent pattern-matchers, but not that great at tracking abstract logical operations. Try changing your viewpoint: rotating the problem into a representation that’s a little more tractable for your mind. Is there a similar problem you’ve seen in the past? Is this a well-known problem?

Make sure you know how to *check* the solution. With the problem isolated to a single function, we can write a test case that verifies the account balances are correct. Then we can experiment freely, and have some confidence that we’ve actually found a solution.

Can you solve a *related* problem? If only concurrent transfers trigger the
problem, could we solve the issue by ensuring transactions never take place
concurrently–e.g. by wrapping the operation in a lock? Could we solve it by
*logging* all transactions, and replaying the log? Is there a simpler variant of
the problem that might be tractable–maybe one that always *overcounts*, but never
*undercounts*?

Consider your assumptions. We rely on layers of abstraction in writing
software–that changing a variable is atomic, that lexical variables don’t
change, that adding 1 and 1 always gives 2. Sometimes, parts of the computer
*fail* to guarantee those abstractions hold. The CPU might–very rarely–fail to
divide numbers correctly. A library might, for supposedly valid input, spit out
a bad result. A numeric algorithm might fail to converge, and spit out wrong
numbers. To avoid questioning *everything*, start in your own code, and work
your way down to the assumptions themselves. See if you can devise tests that
check the language or library is behaving as you expect.

Can you avoid solving the problem altogether? Is there a library, database, or
language feature that does transaction management for us? Is integrating that
library worth the reduced complexity in our application?

We’re not mathematicians; we’re engineers. Part theorist, yes, but also part mechanic. Some problems take a more abstract approach, and others are better approached by tapping it with a wrench and checking the service manual. If other people have solved your problem already, using their solution can be much simpler than devising your own.

Can you think of a way to get more diagnostic information? Perhaps we could log
more data from the functions that are misbehaving, or find a way to dump and
replay transactions from the live program. Some problems *disappear* when
instrumented; these are the hardest to solve, but also the most rewarding.

Combine key phrases in a Google search: the name of the library you’re using,
the type of exception thrown, any error codes or log messages. Often you’ll
find a StackOverflow result, a mailing list post, or a Github issue that
describes your problem. This works well when you know the technical terms for
your problem–in our case, that we’re performing a *atomic*, *transactional*
transfer between two variables. Sometimes, though, you don’t *know* the
established names for your problem, and have to resort to blind queries like
“variables out of sync” or “overwritten data”–which are much more difficult.

When you get stuck exploring on your own, try asking for help. Collect your
description of the problem, the steps you took, and what you expected the
program to do. Include any stacktraces or error messages, log files, and the
smallest section of source code required to reproduce the problem. Also include
the versions of software used–in Clojure, typically the JVM version (`java
-version`), Clojure version (`project.clj`), and any other relevant library
versions.

If the project has a Github page or public issue tracker, like Jira, you can
try filing an issue there. Here’s a [particularly well-written
issue](https://github.com/aphyr/riemann-dash/issues/66) filed by a user on one
of my projects. Note that this user included installation instructions, the
command they ran, and the stacktrace it printed. The more specific a
description you provide, the easier it is for someone else to understand your
problem and help!

Sometimes you need to talk through a problem interactively. For that, I prefer
IRC–many projects have a channel on [the Freenode IRC
network](http://freenode.net/) where you can ask basic questions. Remember to
be respectful of the channel’s time; there may be hundreds of users present,
and they have to sort through everything you write.  Paste your problem
description into a *pastebin* like [Gist](https://gist.github.com/), then
mention the link in IRC with a short–say a few sentences–description of the
problem. I try asking in a channel devoted to a specific library or program
first, then back off to a more general channel, like #clojure. There’s no need
to ask “Can I ask a question” first–just jump in.

Since the transactional problem we’ve been exploring seems like a general issue
with atoms, I might ask in #clojure

```
aphyr > Hi! Does anyone know the right way to change multiple atoms at the same time?
aphyr > This function and test case (http://gist.github.com/...) seems to double-
        or under-count when invoked concurrently.
```

Finally, you can join the project’s email list, and ask your question there.
Turnaround times are longer, but you’ll often find a more in-depth response to
your question via email. This applies especially if you and the maintainer are
in different time zones, or if they’re busy with life. You can also ask
specific problems on StackOverflow or other message boards; users there can be
incredibly helpful.

Remember, other engineers are taking time away from their work, family,
friends, and hobbies to help you. It’s always polite to give them time to
answer first–they may have other priorities. A sincere thank-you is always
appreciated–as is paying it forward by answering other users' questions on the
list or channel!

#### Dealing with abuse

Sadly, some women, LGBT people, and so on experience harassment on IRC or in
other discussion circles. They may be asked inappropriate personal questions,
insulted, threatened, assumed to be straight, to be a man, and so on. Sometimes
other users will attack questioners for inexperience. Exclusion can be overt
(“Read the fucking docs, faggot!”) or more subtle (“Hey dudes, what’s up?”). It
only takes one hurtful experience this to sour someone on an entire community.

If this happens to you, **place your own well-being first**. You are *not* obligated
to fix anyone else’s problems, or to remain in a social context that makes you
uncomfortable.

That said, be aware the other people in a channel may not share your culture.
English may not be their main language, or they may have said something hurtful
without realizing its impact. Explaining how the comment made you feel can jar
a well-meaning but unaware person into reconsidering their actions.

Other times, people are just *mean*–and it only takes one to ruin everybody’s
day. When this happens, you can appeal to a moderator. On IRC, moderators are
sometimes identified by an `@` sign in front of their name; on forums, they may
have a special mark on their username or profile. Large projects may have an
official policy for reporting abuse on their website or in the channel topic.
If there’s no policy, try asking whoever seems in charge for help. Most
projects have a primary maintainer or community manager with the power to mute
or ban malicious users.

Again, these ways of dealing with abuse are *optional*. You have no
responsibility to provide others with endless patience, and it is not your
responsibility to fix a toxic culture. You can always log off and try something
else. There are many communities which will welcome and support you–it may just
take a few tries to find the right fit.

If you don’t find community, you can *build* it. Starting your own IRC channel,
mailing list, or discussion group with a few friends can be a great way to help
each other learn in a supportive environment. And if trolls ever come calling,
you’ll be able to ban them personally.

Now, back to problem-solving.

#### Execute the plan

Sometimes we can make a quick fix in the codebase, test it by hand, and move
on. But for more serious problems, we’ll need a more involved process. I always
try to get a reproducible test suite–one that runs in a matter of seconds–so
that I can continually check my work.

Persist. Many problems require grinding away for some time. Mix blind
experimentation with sitting back and planning. Periodically re-evaluate your
work–have you made progress? Identified a sub-problem that can be solved
independently? Developed a new notation?

If you get stuck, try a new tack. Save your approach as a comment or using `git
stash`, and start fresh. Maybe using a different concurrency primitive is in
order, or rephrasing the data structure entirely. Take a reading break and
review the documentation for the library you’re trying to use. Read the *source
code* for the functions you’re calling–even if you don’t understand exactly what
it does, it might give you clues to how things work under the hood.

Bounce your problem off a friend. Grab a sheet of paper or whiteboard, describe
the problem, and work through your thinking with that person. Their
understanding of the problem might be totally off-base, but can still give you
valuable insight. Maybe they know exactly what the problem is, and can point
you to a solution in thirty seconds!

Finally, take a break. Go home. Go for a walk. Lift heavy, run hard, space out,
drink with your friends, practice music, read a book. Just before sleep, go
over the problem once more in your head; I often wake up with a new algorithm
or new questions burning to get out. Your unconscious mind can come up with
unexpected insights if given time *away* from the problem!

Some folks swear by time in the shower, others by hiking, or with pen and paper
in a hammock. Find what works for you! The important thing seems to be giving
yourself *away* from struggling with the problem.

#### Look back

Chances are you’ll know as soon as your solution works. The program compiles,
transactions generate the correct amounts, etc. Now’s an important time to
*solidify* your work.

Bolster your tests. You may have made the problem less *likely*, but not actually
solved it. Try a more aggressive, randomized test; one that runs for longer,
that generates a broader class of input. Try it on a copy of the production
workload before deploying your change.

Identify *why* the new system works. Pasting something in from StackOverflow may
get you through the day, but won’t help you solve similar problems in the
future. Try to really understand *why* the program went wrong, and how the new
pieces work together to prevent the problem. Is there a more general underlying
problem? Could you generalize your technique to solve a related problem? If
you’ll encounter this type of issue frequently, could you build a function or
library to help build other solutions?

Document the solution. Write down your description of the problem, and why your
changes fix it, as comments in the source code. Use that same description of
the solution in your commit message, or attach it as a comment to the resources
you used online, so that other people can come to the same understanding.

#### Debugging Clojure

With these general strategies in mind, I’d like to talk specifically about the
debugging *Clojure* code–especially understanding its *stacktraces*. Consider this
simple program for baking cakes:

```clojure
(ns scratch.debugging)

(defn bake
  "Bakes a cake for a certain amount of time, returning a cake with a new
  :tastiness level."
  [pie temp time]
  (assoc pie :tastiness
         (condp (* temp time) <
           400 :burned
           350 :perfect
           300 :soggy)))
```

And in the REPL

```clojure
user=> (bake {:flavor :blackberry} 375 10.25)

ClassCastException java.lang.Double cannot be cast to clojure.lang.IFn  scratch.debugging/bake (debugging.clj:8)
```

This is not particularly helpful. Let’s print a full stacktrace using pst:

```clojure
user=> (pst)
ClassCastException java.lang.Double cannot be cast to clojure.lang.IFn
    scratch.debugging/bake (debugging.clj:8)
    user/eval1223 (form-init4495957503656407289.clj:1)
    clojure.lang.Compiler.eval (Compiler.java:6619)
    clojure.lang.Compiler.eval (Compiler.java:6582)
    clojure.core/eval (core.clj:2852)
    clojure.main/repl/read-eval-print--6588/fn--6591 (main.clj:259)
    clojure.main/repl/read-eval-print--6588 (main.clj:259)
    clojure.main/repl/fn--6597 (main.clj:277)
    clojure.main/repl (main.clj:277)
    clojure.tools.nrepl.middleware.interruptible-eval/evaluate/fn--591 (interruptible_eval.clj:56)
    clojure.core/apply (core.clj:617)
    clojure.core/with-bindings* (core.clj:1788)
```

The first line tells us the *type* of the error: a `ClassCastException`. Then
there’s some explanatory text: we can’t cast a `java.lang.Double` to a
`clojure.lang.IFn`. The indented lines show the functions that led to the error.
The first line is the deepest function, where the error actually occurred: the
`bake` function in the `scratch.debugging` namespace. In parentheses is the file
name (`debugging.clj`) and line number (`8`) from the code that caused the error.
Each following line shows the function that *called* the previous line. In the
REPL, our code is invoked from a special function compiled by the REPL
itself–with an automatically generated name like `user/eval1223`, and that
function is invoked by the Clojure compiler, and the REPL tooling. Once we see
something like `Compiler.eval` at the repl, we can generally skip the rest.

As a general rule, we want to look at the *deepest* (earliest) point in the
stacktrace that we *wrote*. Sometimes an error will arise from deep within a
library or Clojure itself–but it was probably *invoked*	 by our code somewhere.
We’ll skim down the lines until we find our namespace, and start our
investigation at that point.

Our case is simple: `bake.clj`, on line 8, seems to be the culprit.

```clojure
         (condp (* temp time) <
```

Now let’s consider the error itself: ClassCastException: java.lang.Double
cannot be cast to clojure.lang.IFn. This implies we had a Double and tried to
cast it to an IFn–but what does “cast” mean? For that matter, what’s a Double,
or an IFn?

A quick google search for java.lang.Double reveals that it’s a class (a Java
type) with some basic documentation. “The Double class wraps a value of the
primitive type double in an object” is not particularly informative–but the
“class hierarchy” at the top of the page shows that a Double is a kind of
java.lang.Number. Let’s experiment at the REPL:

----------------------------

```clojure
user=> (type 4)
java.lang.Long
user=> (type 4.5)
java.lang.Double
```

Indeed: decimal numbers in Clojure appear to be doubles. One of the expressions
in that condp call was probably a decimal. At first we might suspect the
literal values 300, 350, or 400–but those are Longs, not Doubles. The only
Double we passed in was the time duration 10.25–which appears in condp as (*
temp time). That first argument was a Double, but should have been an IFn.

What the heck is an IFn? Its source code has a comment:

IFn provides complete access to invoking any of Clojure’s API’s. You can also access any other library written in Clojure, after adding either its source or compiled form to the classpath.

So IFn has to do with invoking Clojure’s API. Ah–Fn probably stands for
function–and this class is chock full of things like invoke(Object arg1, Object
arg2). That suggests that IFn is about calling functions. And the I? Google
suggests it’s a Java convention for an interface–whatever that is. Remember, we
don’t have to understand everything–just enough to get by. There’s plenty to
explore later.

Let’s check our hypothesis in the repl:

```clojure
user=> (instance? clojure.lang.IFn 2.5)
false
user=> (instance? clojure.lang.IFn conj)
true
user=> (instance? clojure.lang.IFn (fn [x] (inc x)))
true
```

So Doubles aren’t IFns–but Clojure built-in functions, and anonymous functions,
both are. Let’s double-check the docs for condp again:

```clojure
user=> (doc condp)
-------------------------
clojure.core/condp
([pred expr & clauses])


Macro
  Takes a binary predicate, an expression, and a set of clauses.
  Each clause can take the form of either:

  test-expr result-expr

  test-expr :>> result-fn

  Note :>> is an ordinary keyword.

  For each clause, (pred test-expr expr) is evaluated. If it returns
  logical true, the clause is a match. If a binary clause matches, the
  result-expr is returned, if a ternary clause matches, its result-fn,
  which must be a unary function, is called with the result of the
  predicate as its argument, the result of that call being the return
  value of condp. A single default expression can follow the clauses,
  and its value will be returned if no clause matches. If no default
  expression is provided and no clause matches, an
  IllegalArgumentException is thrown.clj
```

That’s a lot to take in! No wonder we got it wrong! We’ll take it slow, and
look at the arguments.

```clojure
(condp (* temp time) <
```

Our pred was (* temp time) (a Double), and our expr was the comparison function
<. For each clause, (pred test-expr expr) is evaluated, so that would expand to
something like

```clojure
((* temp time) 400 <)
```

Which evaluates to something like

```clojure
(123.45 400 <)
```

But this isn’t a valid Lisp program! It starts with a number, not a function.
We should have written (< 123.45 400). Our arguments are backwards!

```clojure
(defn bake
  "Bakes a cake for a certain amount of time, returning a cake with a new
  :tastiness level."
  [pie temp time]
  (assoc pie :tastiness
         (condp < (* temp time)
           400 :burned
           350 :perfect
           300 :soggy)))
user=> (use 'scratch.debugging :reload)
nil
user=> (bake {:flavor :chocolate} 375 10.25)
{:tastiness :burned, :flavor :chocolate}
user=> (bake {:flavor :chocolate} 450 0.8)
{:tastiness :perfect, :flavor :chocolate}
```

Mission accomplished! We read the stacktrace as a path to a part of the program
where things went wrong. We identified the deepest part of that path in our
code, and looked for a problem there. We discovered that we had reversed the
arguments to a function, and after some research and experimentation in the
REPL, figured out the right order.

An aside on types: some languages have a stricter type system than Clojure’s,
in which the types of variables are explicitly declared in the program’s source
code. Those languages can detect type errors–when a variable of one type is
used in place of another, incompatible, type–and offer more precise feedback.
In Clojure, the compiler does not generally enforce types at compile time,
which allows for significant flexibility–but requires more rigorous testing to
expose these errors.

#### Higher order stacktraces

The stacktrace shows us a path through the program, moving downwards through
functions. However, that path may not be straightforward. When data is handed
off from one part of the program to another, the stacktrace may not show the
origin of an error. When functions are handed off from one part of the program
to another, the resulting traces can be tricky to interpret indeed.

For instance, say we wanted to make some picture frames out of wood, but didn’t
know how much wood to buy. We might sketch out a program like this:

```clojure
(defn perimeter
  "Given a rectangle, returns a vector of its edge lengths."
  [rect]
  [(:x rect)
   (:y rect)
   (:z rect)
   (:y rect)])

(defn frame
  "Given a mat width, and a photo rectangle, figure out the size of the frame
  required by adding the mat width around all edges of the photo."
  [mat-width rect]
  (let [margin (* 2 rect)]
    {:x (+ margin (:x rect))
     :y (+ margin (:y rect))}))

(def failure-rate
  "Sometimes the wood is knotty or we screw up a cut. We'll assume we need a
  spare segment once every 8."
  1/8)

(defn spares
  "Given a list of segments, figure out roughly how many of each distinct size
  will go bad, and emit a sequence of spare segments, assuming we screw up
  `failure-rate` of them."
  [segments]
  (->> segments
       ; Compute a map of each segment length to the number of
       ; segments we'll need of that size.
       frequencies
       ; Make a list of spares for each segment length,
       ; based on how often we think we'll screw up.
       (mapcat (fn [ [segment n]]
                 (repeat (* failure-rate n)
                         segment)))))

(def cut-size
  "How much extra wood do we need for each cut? Let's say a mitred cut for a
  1-inch frame needs a full inch."
  1)

(defn total-wood
  [mat-width photos]
  "Given a mat width and a collection of photos, compute the total linear
  amount of wood we need to buy in order to make frames for each, given a
  2-inch mat."
  (let [segments (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
                      ; Convert frames to segments
                      (mapcat perimeter))]

    ; Now, take segments
    (->> segments
         ; Add the spares
         (concat (spares segments))
         ; Include a cut between each segment
         (interpose cut-size)
         ; And sum the whole shebang.
         (reduce +))))

(->> [{:x 8
       :y 10}
      {:x 10
       :y 8}
      {:x 20
       :y 30}]
     (total-wood 2)
     (println "total inches:"))
```

Running this program yields a curious stacktrace. We’ll print the full trace
(not the shortened one that comes with pst) for the last exception *e with the
.printStackTrace function.

```clojure
user=> (.printStackTrace *e)
java.lang.ClassCastException: clojure.lang.PersistentArrayMap cannot be cast to java.lang.Number, compiling:(scratch/debugging.clj:73:23)
    at clojure.lang.Compiler.load(Compiler.java:7142)
    at clojure.lang.RT.loadResourceScript(RT.java:370)
    at clojure.lang.RT.loadResourceScript(RT.java:361)
    at clojure.lang.RT.load(RT.java:440)
    at clojure.lang.RT.load(RT.java:411)
        ...
    at java.lang.Thread.run(Thread.java:745)
Caused by: java.lang.ClassCastException: clojure.lang.PersistentArrayMap cannot be cast to java.lang.Number
    at clojure.lang.Numbers.multiply(Numbers.java:146)
    at clojure.lang.Numbers.multiply(Numbers.java:3659)
    at scratch.debugging$frame.invoke(debugging.clj:26)
    at clojure.lang.AFn.applyToHelper(AFn.java:156)
    at clojure.lang.AFn.applyTo(AFn.java:144)
    at clojure.core$apply.invoke(core.clj:626)
    at clojure.core$partial$fn__4228.doInvoke(core.clj:2468)
    at clojure.lang.RestFn.invoke(RestFn.java:408)
    at clojure.core$map$fn__4245.invoke(core.clj:2557)
    at clojure.lang.LazySeq.sval(LazySeq.java:40)
    at clojure.lang.LazySeq.seq(LazySeq.java:49)
    at clojure.lang.RT.seq(RT.java:484)
    at clojure.core$seq.invoke(core.clj:133)
    at clojure.core$map$fn__4245.invoke(core.clj:2551)
    at clojure.lang.LazySeq.sval(LazySeq.java:40)
    at clojure.lang.LazySeq.seq(LazySeq.java:49)
    at clojure.lang.RT.seq(RT.java:484)
    at clojure.core$seq.invoke(core.clj:133)
    at clojure.core$apply.invoke(core.clj:624)
    at clojure.core$mapcat.doInvoke(core.clj:2586)
    at clojure.lang.RestFn.invoke(RestFn.java:423)
    at scratch.debugging$total_wood.invoke(debugging.clj:62)
        ...
```

First: this trace has two parts. The top-level error (a CompilerException)
appears first, and is followed by the exception that caused the
CompilerException: a ClassCastException. This makes the stacktrace read
somewhat out of order, since the deepest part of the trace occurs in the first
line of the last exception. We read C B A then F E D. This is an old convention
in the Java language, and the cause of no end of frustration.

Notice that this representation of the stacktrace is less friendly than (pst).
We’re seeing the Java Virtual Machine (JVM)’s internal representation of
Clojure functions, which look like clojure.core$partial$fn__4228.doInvoke. This
corresponds to the namespace clojure.core, in which there is a function called
partial, inside of which is an anonymous function, here named fn__4228. Calling
a Clojure function is written, in the JVM, as .invoke or .doInvoke.

So: the root cause was a ClassCastException, and it tells us that Clojure
expected a java.lang.Number, but found a PersistentArrayMap. We might guess
that PersistentArrayMap is something to do with the map data structure, which
we used in this program:

```clojure
user=> (type {:x 1})
clojure.lang.PersistentArrayMap
```

And we’d be right. We can also tell, by reading down the stacktrace looking for
our scratch.debugging namespace, where the error took place:
scratch.debugging$frame, on line 26.

```clojure
  (let [margin (* 2 rect)]
```

There’s our multiplication operation *, which we might assume expands to
clojure.lang.Numbers.multiply. But the path to the error is odd.

```clojure
                 (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
```

In total-wood, we call (map (partial frame mat-width) photos) right away, so
we’d expect the stacktrace to go from total-wood to map to frame. But this is
not what happens. Instead, total-wood invokes something called RestFn–a piece
of Clojure plumbing–which in turn calls mapcat.

```clojure
at clojure.core$mapcat.doInvoke(core.clj:2586)
    at clojure.lang.RestFn.invoke(RestFn.java:423)
    at scratch.debugging$total_wood.invoke(debugging.clj:62)
```

Why doesn’t total-wood call map first? Well it did–but map doesn’t actually
apply its function to anything in the photos vector when invoked. Instead, it
returns a lazy sequence–one which applies frame only when elements are asked
for.

```clojure
user=> (type (map inc (range 10)))
clojure.lang.LazySeq
```

Inside each LazySeq is a box containing a function. When you ask a LazySeq for
its first value, it calls that function to return a new sequence–and that’s
when frame gets invoked. What we’re seeing in this stacktrace is the LazySeq
internal machinery at work–mapcat asks it for a value, and the LazySeq asks map
to generate that value.

```clojure
at clojure.core$partial$fn__4228.doInvoke(core.clj:2468)
    at clojure.lang.RestFn.invoke(RestFn.java:408)
    at clojure.core$map$fn__4245.invoke(core.clj:2557)
    at clojure.lang.LazySeq.sval(LazySeq.java:40)
    at clojure.lang.LazySeq.seq(LazySeq.java:49)
    at clojure.lang.RT.seq(RT.java:484)
    at clojure.core$seq.invoke(core.clj:133)
    at clojure.core$map$fn__4245.invoke(core.clj:2551)
    at clojure.lang.LazySeq.sval(LazySeq.java:40)
    at clojure.lang.LazySeq.seq(LazySeq.java:49)
    at clojure.lang.RT.seq(RT.java:484)
    at clojure.core$seq.invoke(core.clj:133)
    at clojure.core$apply.invoke(core.clj:624)
    at clojure.core$mapcat.doInvoke(core.clj:2586)
    at clojure.lang.RestFn.invoke(RestFn.java:423)
    at scratch.debugging$total_wood.invoke(debugging.clj:62)
```

In fact we pass through map’s laziness twice here: a quick peek at (source
mapcat) shows that it expands into a map call itself, and then there’s a second
map: the one we created in in total-wood. Then an odd thing happens–we hit
something called clojure.core$partial$fn__4228.

```clojure
  (map (partial frame mat-width) photos)
```

The frame function takes two arguments: a mat width and a photo. We wanted a
function that takes just one argument: a photo. (partial frame mat-width) took
mat-width and generated a new function which takes one arg–call it photo–and
calls (frame mad-width photo). That automatically generated function, returned
by partial, is what map uses to generate new elements of its sequence on
demand.

```clojure
user=> (partial + 1)
#<core$partial$fn__4228 clojure.core$partial$fn__4228@243634f2>
user=> ((partial + 1) 4)
5
```

That’s why we see control flow through clojure.core$partial$fn__4228 (an
anonymous function defined inside clojure.core/partial) on the way to frame.

```clojure
Caused by: java.lang.ClassCastException: clojure.lang.PersistentArrayMap cannot be cast to java.lang.Number
    at clojure.lang.Numbers.multiply(Numbers.java:146)
    at clojure.lang.Numbers.multiply(Numbers.java:3659)
    at scratch.debugging$frame.invoke(debugging.clj:26)
    at clojure.lang.AFn.applyToHelper(AFn.java:156)
    at clojure.lang.AFn.applyTo(AFn.java:144)
    at clojure.core$apply.invoke(core.clj:626)
    at clojure.core$partial$fn__4228.doInvoke(core.clj:2468)
```

And there’s our suspect! scratch.debugging/frame, at line 26. To return to that
line again:

```clojure
  (let [margin (* 2 rect)]
```

* is a multiplication, and 2 is obviously a number, but rect… rect is a map
  here. Aha! We meant to multiply the mat-width by two, not the rectangle.

```clojure
(defn frame
  "Given a mat width, and a photo rectangle, figure out the size of the frame
  required by adding the mat width around all edges of the photo."
  [mat-width rect]
  (let [margin (* 2 mat-width)]
    {:x (+ margin (:x rect))
     :y (+ margin (:y rect))}))
```

I believe we’ve fixed the bug, then. Let’s give it a shot!

The unbearable lightness of nil
There’s one more bug lurking in this program. This one’s stacktrace is short.

```clojure
user=> (use 'scratch.debugging :reload)

CompilerException java.lang.NullPointerException, compiling:(scratch/debugging.clj:73:23) 
user=> (pst)
CompilerException java.lang.NullPointerException, compiling:(scratch/debugging.clj:73:23)
    clojure.lang.Compiler.load (Compiler.java:7142)
    clojure.lang.RT.loadResourceScript (RT.java:370)
    clojure.lang.RT.loadResourceScript (RT.java:361)
    clojure.lang.RT.load (RT.java:440)
    clojure.lang.RT.load (RT.java:411)
    clojure.core/load/fn--5066 (core.clj:5641)
    clojure.core/load (core.clj:5640)
    clojure.core/load-one (core.clj:5446)
    clojure.core/load-lib/fn--5015 (core.clj:5486)
    clojure.core/load-lib (core.clj:5485)
    clojure.core/apply (core.clj:626)
    clojure.core/load-libs (core.clj:5524)
Caused by:
NullPointerException 
    clojure.lang.Numbers.ops (Numbers.java:961)
    clojure.lang.Numbers.add (Numbers.java:126)
    clojure.core/+ (core.clj:951)
    clojure.core.protocols/fn--6086 (protocols.clj:143)
    clojure.core.protocols/fn--6057/G--6052--6066 (protocols.clj:19)
    clojure.core.protocols/seq-reduce (protocols.clj:27)
    clojure.core.protocols/fn--6078 (protocols.clj:53)
    clojure.core.protocols/fn--6031/G--6026--6044 (protocols.clj:13)
    clojure.core/reduce (core.clj:6287)
    scratch.debugging/total-wood (debugging.clj:69)
    scratch.debugging/eval1560 (debugging.clj:81)
    clojure.lang.Compiler.eval (Compiler.java:6703)
```

On line 69, total-wood calls reduce, which dives through a series of functions
from clojure.core.protocols before emerging in +: the function we passed to
reduce. Reduce is trying to combine two elements from its collection of wood
segments using +, but one of them was nil. Clojure calls this a
NullPointerException. In total-wood, we constructed the sequence of segments
this way:

```clojure
  (let [segments (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
                      ; Convert frames to segments
                      (mapcat perimeter))]

    ; Now, take segments
    (->> segments
         ; Add the spares
         (concat (spares segments))
         ; Include a cut between each segment
         (interpose cut-size)
         ; And sum the whole shebang.
         (reduce +))))
```

Where did the nil value come from? The stacktrace doesn’t say, because the
sequence reduce is traversing didn’t have any problem producing the nil. reduce
asked for a value and the sequence happily produced a nil. We only had a
problem when it came time to combine the nil with the next value, using +.

A stacktrace like this is something like a murder mystery: we know the program
died in the reducer, that it was shot with a +, and the bullet was a nil–but we
don’t know where the bullet came from. The trail runs cold. We need more
forensic information–more hints about the nil’s origin–to find the culprit.

Again, this is a class of error largely preventable with static type systems.
If you have worked with a statically typed language in the past, it may be
interesting to consider that almost every Clojure function takes Option[A] and
does something more-or-less sensible, returning Option[B]. Whether the error
propagates as a nil or an Option, there can be similar difficulties in
localizing the cause of the problem.

Let’s try printing out the state as reduce goes along:

```
    (->> segments
         ; Add the spares
         (concat (spares segments))
         ; Include a cut between each segment
         (interpose cut-size)
         ; And sum the whole shebang.
         (reduce (fn [acc x] (prn acc x) (+ acc x))))))
user=> (use 'scratch.debugging :reload)
12 1
13 14
27 1
28 nil

CompilerException java.lang.NullPointerException, compiling:(scratch/debugging.clj:73:56) 
```

Not every value is nil! There’s a 14 there which looks like a plausible segment
for a frame, and two one-inch buffers from cut-size. We can rule out interpose
because it inserts a 1 every time, and that 1 reduces correctly. But where’s
that nil coming from? Is from segments or (spares segments)?

```clojure
  (let [segments (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
                      ; Convert frames to segments
                      (mapcat perimeter))]

    (prn :segments segments)
user=> (use 'scratch.debugging :reload)
:segments (12 14 nil 14 14 12 nil 12 24 34 nil 34)
```

It is present in segments. Let’s trace it backwards through the sequence’s
creation. It’d be handy to have a function like prn that returned its input, so
we could spy on values as they flowed through the ->> macro.

```clojure
(defn spy
  [& args]
  (apply prn args)
  (last args))
  (let [segments (->> photos
                      ; Convert photos to frame dimensions
                      (map (partial frame mat-width))
                      (spy :frames)
                      ; Convert frames to segments
                      (mapcat perimeter))]
user=> (use 'scratch.debugging :reload)
:frames ({:x 12, :y 14} {:x 14, :y 12} {:x 24, :y 34})
:segments (12 14 nil 14 14 12 nil 12 24 34 nil 34)
```

Ah! So the frames are intact, but the perimeters are bad. Let’s check the perimeter function:

```clojure
(defn perimeter
  "Given a rectangle, returns a vector of its edge lengths."
  [rect]
  [(:x rect)
   (:y rect)
   (:z rect)
   (:y rect)])
```

Spot the typo? We wrote :z instead of :x. Since the frame didn’t have a :z
field, it returned nil! That’s the origin of our NullPointerException. With the
bug fixed, we can re-run and find:

```clojure
user=> (use 'scratch.debugging :reload)
total inches: 319
```

Whallah!

#### Recap

As we solve more and more problems, we get faster at debugging–at skipping over
irrelevant log data, figuring out exactly what input was at fault, knowing what
terms to search for, and developing a network of peers and mentors to ask for
help. But when we encounter unexpected bugs, it can help to fall back on a
family of problem-solving tactics.

We explore the problem thoroughly, localizing it to a particular function,
variable, or set of inputs. We identify the boundaries of the problem, carving
away parts of the system that work as expected. We develop new notation, maps,
and diagrams of the problem space, precisely characterizing it in a variety of
modes.

With the problem identified, we search for extant solutions–or related problems
others have solved in the past. We trawl through issue trackers, mailing list
posts, blogs, and forums like Stackoverflow, or, for more theoretical problems,
academic papers, Mathworld, and Wikipedia, etc. If searching reveals nothing,
we try rephrasing the problem, relaxing the constraints, adding debugging
statements, and solving smaller subproblems. When all else fails, we ask for
help from our peers, or from the community in IRC, mailing lists, and so on, or
just take a break.

We learned to explore Clojure stacktraces as a trail into our programs, leading
to the place where an error occurred. But not all paths are linear, and we saw
how lazy operations and higher-order functions create inversions and
intermediate layers in the stacktrace. Then we learned how to debug values that
were distant from the trace, by adding logging statements and working our way
closer to the origin.

Programming languages and us, their users, are engaged in a continual dialogue.
We may speak more formally, verbosely, with many types and defensive
assertions–or we may speak quickly, generally, in fuzzy terms. The more precise
we are with the specifications of our program’s types, the more the program can
assist us when things go wrong. Conversely, those specifications harden our
programs into strong but rigid forms, and rigid structures are harder to bend
into new shapes.

In Clojure we strike a more dynamic balance: we speak in generalities, but we
pay for that flexibility. Our errors are harder to trace to their origins.
While the Clojure compiler can warn us of some errors, like mis-spelled
variable names, it cannot (without a library like core.typed) tell us when we
have incorrectly assumed an object will be of a certain type. Even very rigid
languages, like Haskell, cannot identify some errors, like reversing the
arguments to a subtraction function. Some tests are always necessary, though
types are a huge boon.

No matter what language we write in, we use a balance of types and tests to
validate our assumptions, both when the program is compiled and when it is run.

The errors that arise in compilation or runtime aren’t rebukes so much as
hints. Don’t despair! They point the way towards understanding one’s program in
more detail–though the errors may be cryptic. Over time we get better at
reading our language’s errors and making our programs more robust.
