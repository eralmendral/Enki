package main

import "fmt"

type person struct {
	name  string
	age   int
	human bool
}

func main() {
	p := person{
		name:  "John",
		age:   25,
		human: true,
	}

	fmt.Println(p.name)

	fmt.Printf("%T\n", p)
}
