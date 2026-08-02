# Go Language Fundamentals

This is the recommended order for the Go language section. Each major topic has
its own notes file in this directory.

## 1. Getting Started

- [Why Go?](#why-go)
- [Compilation Process](#compilation-process)
- [Compiled vs. Interpreted](#compiled-vs-interpreted)
- [Memory Footprint](#memory-footprint)
- [Comments](#comments)

### Why Go?

Six useful answers:

1. Fast compilation
2. Efficient execution
3. Simple language design
4. Built-in concurrency support
5. Strong tooling and formatting
6. Easy deployment as a single compiled binary

### Compilation Process

```text
Go source code -> go build/compiler -> machine-code executable
```

A Go program normally starts with:

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, Go")
}
```

Compilation errors are detected before the program runs. Runtime errors happen
after the executable has started.

### Compiled vs. Interpreted

- A compiled language turns source code into an executable before it runs.
- An interpreted language runs source code through an interpreter at runtime.
- Go is compiled, so the production environment does not need the Go compiler
  or the original source code to run the executable.

### Memory Footprint

Go binaries include the Go runtime, including services such as garbage
collection. Go programs are generally lightweight, but the final binary size
depends on the imported packages and build configuration.

### Comments

```go
// This is a single-line comment.

/* This is a
   multi-line comment. */
```

## 2. Variables and Types

The topics below form the variables and types foundation.

### Variable Declaration

```go
var age int
var name string = "Eric"
```

### Basic Variables

Common basic types include `bool`, `string`, `int`, `float64`, `byte`, and
`rune`.

```go
var active bool = true
var name string = "Eric"
var age int = 30
var score float64 = 99.5
var initial byte = 'E'
```

### Short Variable Declaration

The `:=` syntax declares and initializes a variable inside a function. Go
infers its type.

```go
pi := 3.14
name := "Eric"
```

### Same-Line Declarations

```go
age, name := 30, "Eric"
```

At least one variable on the left side of `:=` must be new in that scope.

### Blank Identifier

Use `_` when a returned value is intentionally ignored.

```go
_, value := someFunction()
```

### Statically Typed

Go is statically typed: every variable has a type known by the compiler, and
incompatible values must be converted explicitly.

```go
temperatureFloat := 99.11
temperatureInt := int64(temperatureFloat)
```

### Type Sizes

- Whole numbers: `int`, `int8`, `int16`, `int32`, `int64`
- Unsigned whole numbers: `uint`, `uint8`, `uint16`, `uint32`, `uint64`,
  `uintptr`
- Decimal numbers: `float32`, `float64`
- Complex numbers: `complex64`, `complex128`

The number in a type name represents its bit width. `int` and `uint` are
platform-dependent; use a specific width when the representation matters.

### Runes and String Encoding

Strings are sequences of bytes. A `rune` is an alias for `int32` and represents
a Unicode code point, so it is useful when working with individual characters.

```go
for _, r := range "Hello" {
	fmt.Printf("%c ", r)
}

## 3. Constants and Formatting

### `const`

Constants are declared with `const` and cannot use `:=`.

```go
const pi = 3.14159
```

### Computed Constants

Constant expressions are evaluated at compile time.

```go
const firstName = "Eric"
const lastName = "Almendral"
const fullName = firstName + " " + lastName
```

Runtime values cannot be constants:

```go
// const currentTime = time.Now() // invalid: evaluated at runtime
```

### Formatting

`fmt.Printf` prints a formatted value; `fmt.Sprintf` returns the formatted
string.

| Verb | Meaning |
|---|---|
| `%v` | Default value format |
| `%s` | String |
| `%d` | Integer |
| `%f` | Floating-point number |
| `%.2f` | Floating-point number with two decimals |

```go
message := fmt.Sprintf("%s is %d years old", "Eric", 30)
fmt.Printf("Pi: %.2f\n", 3.14159)
```

## 4. Conditionals and Control Flow

- [Conditionals](Conditionals.md)
- [Loops](Loops.md)
- `if` / `else`
- Initial statements
- `switch`

### `if` / `else`

```go
if age >= 18 {
	fmt.Println("adult")
} else {
	fmt.Println("minor")
}
```

### Initial Statement

An `if` statement may declare a short-lived value before its condition.

```go
if length := len(name); length > 0 {
	fmt.Println("name is set")
}
```

### `switch`

```go
switch day {
case "Saturday", "Sunday":
	fmt.Println("weekend")
default:
	fmt.Println("weekday")
}
```

## 5. Core Language Features

1. [Functions (21)](Functions.md)
2. [Structs](Structs.md)
3. [Interfaces](Interfaces.md)
4. [Errors](Errors.md)
5. [Loops](Loops.md)
6. [Slices](Slices.md)
7. [Maps](Maps.md)
8. [Pointers](Pointers.md)

## 6. Packages, Modules, and Concurrency

1. [Packages and Modules](Packages.md)
2. [Channels](Channels.md)
3. [Mutexes](Mutexes.md)

The concurrency sequence is:

```text
goroutines -> channels -> shared state -> mutexes
```

## 7. Advanced Language Features

1. [Generics](Generics.md)
2. [Enums](Enums.md)

Go does not have a dedicated `enum` keyword. Enumerated values are commonly
modeled with a named type, `const`, and `iota`.

```go
type Status int

const (
	Pending Status = iota
	Running
	Done
)
```
