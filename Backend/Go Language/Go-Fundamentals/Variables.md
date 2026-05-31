# Variables & Types

## Topics
- Variables
- Comments
- Compilation Process
- Type Sizes
- Constants
- Formatting Strings
- Runes and String Encoding

---

## Variables

### Basic Types
- `bool` - true/false
- `string` - text
- `int` - integers
- `float64` - decimals
- `byte` - alias for uint8

### Variable Declaration (2 ways)

**1. var keyword**
```go
var name string = "Eric"
var age int = 25
var isActive bool = true
```

**2. Short declaration (walrus operator)**
```go
name := "Eric"
age := 25
isActive := true
```

### Same Line Declarations
```go
age, name := 10, "Eric"
x, y, z := 1, 2, 3
```

### Blank Identifier
```go
_, value := someFunction()  // ignore first return value
```

---

## Comments

### Single Line
```go
// This is a single line comment
```

### Multi Line
```go
/*
  This is a
  multi-line comment
*/
```

---

## Compilation Process

Code -> Compiler (`go build`) -> Executable

### Go Program Structure
1. `package main` - declares the package
2. `import "fmt"` - import packages
3. `func main()` - entry point

### Two Kinds of Bugs
1. **Compilation errors** - occur when code is compiled. Better to catch here as they won't reach production.
2. **Runtime errors** - occur when program is running. Can cause crashes or unexpected behavior.

---

## Type Sizes

### Whole Numbers (No Decimals)
`int` `int8` `int16` `int32` `int64`

### Positive Whole Numbers (Unsigned)
`uint` `uint8` `uint16` `uint32` `uint64` `uintptr`

### Decimal Numbers
`float32` `float64`

### Complex Numbers
`complex64` `complex128`

> The size (8, 16, 32, 64, 128) represents how many **bits** in memory will be used. The default `int` and `uint` types use 32 or 64 bits depending on the system.

### Which Type Should I Use?
Standard types (use these by default):
```go
int
uint
float64
complex128
```

> Only use specific sizes when concerned about performance and memory usage, or when you need a specific range (e.g., `uint64` for very large positive integers).

### Type Conversion
```go
temperatureFloat := 99.11
temperatureInt := int64(temperatureFloat)
```

---

## What is Statically Typed?

Go is statically typed - types are determined at **compile time**, not runtime.

```go
var age int = 25      // type declared
name := "Go"          // type inferred at compile time
age = "hello"         // COMPILE ERROR - can't assign string to int
```

Benefits:
- Catch type errors before running
- Better performance (no runtime type checking)
- IDE support and autocompletion

---

## Constants

Declared with `const` keyword. Cannot use `:=` syntax.

```go
const pi = 3.14159
const maxRetries = 3
```

- Can be: strings, integers, booleans, floats
- Cannot be: slices, maps, structs

### Computed Constants
```go
const firstName = "Eric"
const lastName = "Almendral"
const fullName = firstName + " " + lastName
```

> Cannot declare constants computed at runtime:
```go
const currentTime = time.Now()  // ERROR - computed at runtime
```

---

## Concatenating Strings

```go
first := "Hello"
second := "World"
result := first + " " + second  // "Hello World"
```

---

## Formatting Strings in Go

### Functions
- `fmt.Printf` - prints formatted string to stdout
- `fmt.Sprintf` - returns formatted string

### Format Verbs
| Verb | Description | Example |
|------|-------------|---------|
| `%v` | Default format | `fmt.Printf("%v", 42)` |
| `%s` | String | `fmt.Printf("%s", "hello")` |
| `%d` | Integer (decimal) | `fmt.Printf("%d", 42)` |
| `%f` | Float | `fmt.Printf("%f", 3.14)` |
| `%.2f` | Float (2 decimals) | `fmt.Printf("%.2f", 3.14159)` |

```go
name := "Alice"
age := 30
s := fmt.Sprintf("Name: %s, Age: %d", name, age)
```

---

## Runes and String Encoding

In many languages, a "character" is a single byte (8 bits). ASCII encoding represents 128 characters with 7 bits - enough for English alphabet, numbers, and special characters.

### Go's Approach
- Strings are sequences of bytes
- `rune` type is an alias for `int32` (32-bit integer)
- Large enough to hold any Unicode code point

### Key Takeaways
1. Use `rune` type when working with individual characters (can be more than one byte)
2. Go handles Unicode characters (emojis, Chinese, etc.) natively

```go
s := "Hello"
for _, r := range s {
    fmt.Printf("%c ", r)  // prints each character
}
```

---

## Memory Footprint

Go programs are lightweight. Each executable includes a small "Go Runtime" that:
- Manages goroutines
- Includes a **garbage collector** that automatically frees unused memory
- Handles memory allocation

> This is why Go is described as "garbage collected" - you don't manually free memory like in C/C++.
