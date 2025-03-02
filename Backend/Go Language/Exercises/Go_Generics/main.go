package main

type myNumbers interface {
	int | float64
}

func addInt(a, b int) int {
	return a + b
}

func addFloat(a, b float64) float64 {
	return a + b
}

func addGeneric[T int | float64](a, b T) T {
	return a + b
}

func addGenericUsingInterface[T myNumbers](a, b T) T {
	return a + b
}

func main() {
	println(addInt(1, 2))
	println(addFloat(1.1, 2.2))
	println(addGeneric(1, 2))
	println(addGeneric(1.1, 2.2))
	println(addGenericUsingInterface(1, 2))
	println(addGenericUsingInterface(1.1, 2.2))
}
