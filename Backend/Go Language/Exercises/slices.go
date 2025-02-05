package main

import "fmt"

func main() {
	// Creating a slice
	slice := []int{1, 2, 3, 4, 5}
	fmt.Println(slice)

	// Creating a slice with make
	slice2 := make([]int, 0, 5)

	fmt.Println(slice2)
}
