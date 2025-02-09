package main

import "fmt"

type person struct {
	name  string
	age   int
	human bool
}

// embedded struct
type hunter struct {
	rank string
	person
}

func main() {
	p := person{
		name:  "John",
		age:   25,
		human: true,
	}

	fmt.Println(p.name)

	fmt.Printf("%T\n %v", p, p)


	gon := hunter {
		person: person(name: "Gon", age: 12, human: true),
		rank: "Rookie",
	}

	fmt.Printf("%v", gon)

	netero := struct {
		name: string
		age: int
		rank: int
	}(
		name: "Netero",
		age: 125,
		rank: 1,
	)

	fmt.Printf("%v", netero)


}
