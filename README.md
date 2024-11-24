# SML Introduction

## Introduction

- SML means Standard Meta Language.
- Based on formal semantics.
- Has industrial strength.
- Basis library is based on advanced module system.
- Compilers:

  - SML/NJ
  - Moscow ML

## Features

- Everything is build from expressions.
- Support for structured values: lists, trees.
- Strong type system.

## Data Types

- real: 1.0
- string: "abc"

  - Concat -> "ab"^"c"

- char: #"a"
- int: 2
- bool: true, false

## Variables

```sml
val variable = value;
```

## Functions

### Lambda Abstractions

```sml
fn x => x + 1;

(* to use function *)
val twice = (fn x => 2*x);
twice 2; # returns 4
```

### Actual Functions

```sml
fun double x = 2*x;
double 2; (* returns 4 *)
```

### Pattern Matching

```sml
fun fac 0 = 1
  | fac n = n * (fac (n-1));
```

## Complex Data Types

### Tuples

```sml
val pair = (1, "abc");
val triple = (1, true, 1.0);
```

- Projections are used to access value fields inside tuples via index.
- Index starts with 1.

```sml
#2(triple); (* returns true *)
```

- Projections can also be used to deconstruct tuples into variables.

```sml
val (x,y) = pair; (* x = 1; y = "abc" *)
```

### Lists

```sml
val l = [1,2,3];
```

- To access items use, `hd` to access first element. `tl` to access all elements
  apart from the first one.
- Sample function to append lists. The arguments must be of the same type.

```sml
fun append nil l = l
  | append (h::t) l = h::(append t l);
```

## Create Custom Data Types

```sml
datatype colour = red | blue | green;
(* red is of type colour. *)
```

## Other Features

- Polymorphic functions.
- Higher-order functions -> functions as parameters.
- `map` -> apply function on each element.
- To read program from text file into repl: `use "file.sml";`
- To print a string to stdout: `print "Hello";`

## How To Run Program

### SML

```bash
sml main.sml
```

- The tests will show their outputs.
- You can also use the functions to insert, search, traverse and delete family
  members in the family tree.

### UI

- Open `index.html` in your browser to see initial family tree (2-3 B tree).

### Functions Usage

- Insertion

```sml
insert familyTree familyMember;
```

- Deletion

```sml
delete familyTree memberID;
```

- Traversal

```sml
inOrderTraversal familyTree;
```

- Searching

```sml
search familyTree memberID;
```

- Display

```sml
FamilyMemberToString familyMember;
```
