package main

import (
	"fmt"
)

func main() {

	z := 10.0
	y := 10


	fmt.Printf("%v of type %T\n", z, z)
	fmt.Printf("%v of type %T\n", y, y)

	var num float32 = 11.1

	z = num // does not work
	z = float64(num) // works

	fmt.Printf("%v of type %T\n", z, z)
}