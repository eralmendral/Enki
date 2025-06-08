# Topics
- Variables
- Conditionals
- Functions
- Structs
- Interfaces
- Errors
- Loops 
- Slices
- Maps
- Pointers
- Package and Modules
- Channels
- Mutexes
- Generics
- Enums


## Variables
- bool, string, int, float64, byte
- walrus operator 
```go
   pi := 3.14
   name := "Eric"
```


### Compilation Process
 - computers need machine code.
 - code -> compiler (go build) -> executable

 - Go Program Strcuture
 1. package main
 2. import "fmt" -> imports
 3. func main() -> defines the main function, the entry point for a Go program.


 - Two Kinds of Bugs:
 1. Compilation errors - Occur when code is compiled. it's generally better to have compilation errors because they'll never accidentally make it into production.
 2. Runtime errors - Occur when a program is running. These are generally worse because they can cause your program to crash or behave unexpectedly.

### Type Sizes
- Whole Numbers (No Decimals)
- int int8 int16 int32 int64


- Positive Whole Numbers(No Decimals)
- uint unit8 unit16 uint32 uint64 uintptr


- Signed Decimal Numbers
- float32 float64


- Complex Numbers
- complex64 complex128

### The size (8,16,32,64,128, etc) represents how many **bits** in memory will be used to store the variables. The "default" **int** and **uint** types refer to their respective 32 or 64-bit sizes depending on the environment of the user.

- The standard sizes that should be used unless you have a specific performance need(e.g. using less memory ) are:
- int
- uint
- float64
- complex128


### Converting 
- Some types can be easily converted like this:
- temperatureFloat := 99.11
- temperatureInt := int64(temperatureFloat)

### Compiled vs Interpreted
- You can run a compiled program without the original source code. You don't need the compiler anymore after it's job is done. That's how most video games are distrivuted! Players don't need to install the correct verson of Go to run a PC game: they just download the executable game and run it.


- code -> compiler -> executable -> "only the compiled executable runs in the production no compiler required."
- code -> source code copied to production -> interpreter -> code and interpreter required in production.

### Same line declaration
```go
 age, name := 10, "Eric"

 age := 10
 name := "Eric"
```


### Memory Footprint
- Go programs are faily lightweight. Earch program includes a small amount of extra code that's included in the executable binary called the 'Go Runtime'.
- One of the purposes of the Go runtime is to clean up unused memory at runtime. It includes a garbage collector that automatically frees up memory that's no longer in use.


### Constants
- are declared with the **const** keyword. They can't use the **:=** short description syntax.
```go
const pi = 3.14159
```

- constants can be primitive types like strings, integers, booleans and floats. They can't be more complex like slices, maps, and structs.


### Computed Constants
```go
 const firstName = "Eric"
 const lastName = "Almendral"
 const fullName = firstName + " " + lastName
```

- You cannot declare a constant that can only be computed at run-time like you can in JavaScript.
```go
 const currentTime = time.Now() // this breaks
```

### Formatting Strings in Go
- fmt.Printf - prints a formatted string to standard out.
- fmt.Sprintf - returns the formatted string

```go
  s := fmt.Sprintf("I am %v years old", 10) // %s, %d, %f, %.2f
```

- %s - string
- %d - integer
- %f - float
- %.2f - float with 2 decimals


### Runes and String Encoding
- In many programming language, a "character" is a single byte (8 bits). Using ASCII encoding, the standard for the C programming language, we can represent 128 characters in 7bits. This is enough for the English alphabet, numbers, and some special characters.
- In Go, strings are just sequest of bytes: they can hold artbitrary data. However, Go also has a special type, **rune**, which is an alias for **int32**. This means that a rune is a 32-bit integer, which is large enough to hold any Unicode code point.

- There are 2 main takeaways:
1. When you need to work with individual characters in a string, you should use the **rune** type. It breaks strings up into their individual characters, which can e more than one byte long.
2. We can include a wide variety of Unicode characters in our strnigs, such as emojis and Chinese characters, and Go will handle them just fine.


