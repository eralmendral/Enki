-Introduction to TypeScript
- TypeScript Types
- Type Inference
- Type Compatibility
- Combining types
- Type Guards / Narrowing
- TypeScript functions
- TypeScript Interfaces
- Classes
- Generics
- Decorators
- Utility Types
- Advance Types
- TypeScript Modules
- Ecosystem


<hr>

## Introduction to TypeScript
 - superset of JavaScript
 - all JavaScript code is valid  TypeScript code.
 - TypeScript is a language, but the mplementation of TypeScript is the TypeScript compiler, tsc.
 - TypeScrpt is not supported natively by most JS Engine, so it needs to be compiled to JS code before it can be run.
 - It's only typechecked before it's rn.
 - TypeScript is interesting in that it's "compiled", but not in the traditional (compiled to binary) sense. Instead it's compiled to JavaScript. So it's not really compiled for performance reasons, but rather for compatibility reaons.
 - Only if the compilation is successful, then we run the code. So your code needs to pass compilation, and needs to run correctly.
 - <b> THE GOAL of TS is to write JS code that's easier to work with. </b>
 


## Basic Types
- string, number, boolean, null, undefined, any

## Type Inference
- implicit typing

<hr>

<br>

## Functions
- Typing the parameter and return type
- Inferred return type
- Void return 

### Function Types
- functions themselves are values in JS which means they also has a type.

```
 (param: type1, param2: type2, ...) => returnType
```

<br>

```
(a: number, b: number) => number
```

<br>

```
const add = (a, b) => a + b
const sub = (a, b) => a - b

```

### Type Alias
 - It can get really cumbersome to write out long custom types whenver you want to use them.  
 - Example

```
function setLogger( loggerCallback: (s1: string, s2: string) => string, 
                       delay: number) {}

```

<br>

```
type LoggerCallback = (s1: string, s2: string) => string

```

```
function setLogger( loggerCallback: LoggerCallback) {}

``

### Importing Types
- <b> import type </b> syntax

```
import type { User, Post } from './models'
```
- This way TS knows that you're only importing types, and it can drop the imports from the compield JS code. This syntax also works

```
import { type User, type Post } from './models'
```

<br>
<hr>
<br>

## Unions
- 



