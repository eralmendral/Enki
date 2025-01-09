package main

// https://go.dev/ref/spec#Declarations_and_scope

import "fmt"

var x int = 10

func main() {
	// x can be accessed here
	fmt.Println(x)   // 10

	printMe()  // 10

	// variable "shadowing"
	x := 20
	fmt.Println(x) // 20

	printMe()  // 10


	 if y := 50; y > 0 {
		 fmt.Println(y)
	 }
}

func printMe() {
	// x can be accessed here
	fmt.Println(x)
}

// type person is in package block scope
type person struct {
	name string
}

// the method sayHello
// which is attached to Values for type person
// is in "package block scope"
func (p person) sayHello() {
	fmt.Println("Hi, my name is ", p.name)
}
