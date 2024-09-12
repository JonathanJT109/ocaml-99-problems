- Choose the right tool for the right job
- There's no universally perfect language

### What is a functional language?

- Defnies computations as mathematical functions
- avoids mutable state
- State: the information maintained by a computation

`Mutability break referential transparency. The ability to replace expression with its value without affecting result of computation`

### Imperative programming

Commands specify hot to compute by destructively chaning state.
x = x + 1
Functions/methods have side effects (returning the value and changing the state)

### Functional programming

Expressions specify what to compute

- variables never change value (immutability)
- functions never have side effects

### Why functional programming?

- Programming transcends programming in a language
- Functional languages predict the future (features in fp before ip: garbage collections)
- Functional languages are sometimes used in industry
- Functional languages are elegant (objectively). Elegant code is easier to read and maintain

### OCaml

- Objective (objective layer added). caml: Categorical Abstract Machine Language.
- ML family. Meta Language for writing proofs.
- Features:
  - Immutable programming
  - Algebraic datatypes and patter matching
  - First-calss functions
  - Static type-checking
  - Automatic type inference
  - Parametric polymorphism
  - Garbage collections
  - Modules

### Learning a new programming language

- Syntax
- Semantics
- Idioms (patterns to express thoughts)
- Libraries
- Tools

### Expressions

- Statements or commands
- Every kind of expression has: syntax and semantics

#### values

A value is an expression that does not need any further evaluation.

\* multiplication with ints
\*. multiplication with floats

Specify type (value : type)
if-else statements need to return the same type

==> evaluates to
: has type
val x : int = 42 "value 42 of type int and is bound to the name x"
identifiers: variables
\- anonymous expresssion
anonymous function (lambda expression): Syntax fun x1 ... xn -> e
functions are values. functions can be passed as arguments and also returned.
