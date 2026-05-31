# Go Quick Reference

## Variables
```go
var name string = "Eric"   // explicit type
age := 25                  // short declaration
x, y := 1, 2               // same line
```

## Types
| Type | Description |
|------|-------------|
| `bool` | true/false |
| `string` | text |
| `int` | integers |
| `float64` | decimals |
| `byte` | alias for uint8 |
| `rune` | alias for int32 (Unicode) |

## Comments
```go
// single line
/* multi line */
```

## Constants
```go
const pi = 3.14159
```

## String Formatting
```go
fmt.Printf("%s", "hello")   // string
fmt.Printf("%d", 42)        // integer
fmt.Printf("%f", 3.14)      // float
fmt.Printf("%v", anything)  // default format
```

## Structs
```go
type car struct {
    brand string
    color string
}
```

## Slices
```go
nums := []int{1, 2, 3}
nums = append(nums, 4)
```

## Maps
```go
m := map[string]int{"a": 1, "b": 2}
```

## Control Flow
```go
if x > 0 { }
switch x { case 1: }
for i := 0; i < 10; i++ { }
for _, v := range slice { }
```

## Functions
```go
func add(a, b int) int {
    return a + b
}
```

## Errors
```go
if err != nil {
    return err
}
```

## Goroutines
```go
go doSomething()
```

## Channels
```go
ch := make(chan int)
ch <- 42       // send
val := <-ch    // receive
```
