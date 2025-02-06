package main

func main() {
	// Creating a slice
	// slice := []int{1, 2, 3, 4, 5}
	// fmt.Println(slice)

	// // Creating a slice with make

	// slice2 := make([]int, 0, 5)

	// // Printing the length
	// fmt.Println(len(slice2))

	// // Printing the capacity
	// fmt.Println(cap(slice2))

	// fmt.Println(slice2)

	// slice2 = append(slice2, 2)

	// fmt.Println(slice2)

	// Learning about the capacity and length

	// xi := make([]int, 0, 3)
	// fmt.Println(xi)
	// fmt.Println(len(xi))
	// fmt.Println(cap(xi))

	// xi = append(xi, 1, 2, 3)
	// fmt.Println(xi)
	// fmt.Println("----")
	// fmt.Println(len(xi))
	// fmt.Println(cap(xi))

	// fmt.Println("----")

	// xi = append(xi, 11, 21, 31)
	// fmt.Println(xi)
	// fmt.Println("----")
	// fmt.Println(len(xi))
	// fmt.Println(cap(xi))

	// Multi Dimensional Slice

	s1 := []string{"Harry", "Potter'"}
	s2 := []string{"Ron", "Weasley"}
	s3 := []string{"Hermione", "Granger"}

	wizards := [][]string{s1, s2}
}
