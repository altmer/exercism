package diffsquares

const testVersion = 1

// SquareOfSums returns square of the sum of the first n natural numbers
func SquareOfSums(n int) int {
	res := 0
	for i := 1; i <= n; i++ {
		res += i
	}
	return res * res
}

// SumOfSquares returns the sum of the squares of the first n natural numbers
func SumOfSquares(n int) int {
	res := 0
	for i := 1; i <= n; i++ {
		res += i * i
	}
	return res
}

// Difference returns difference between the square of the sum of the first
// n natural numbers and the sum of the squares of the first n
// natural numbers.
func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}
