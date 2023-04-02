package pascal

const testVersion = 1

// Triangle returns Pascal's triangle with n rows
func Triangle(n int) [][]int {
	res := [][]int{}
	for i := 0; i < n; i++ {
		res = append(res, row(i))
	}
	return res
}

func row(n int) []int {
	res := []int{1}
	for k := 0; k < n; k++ {
		res = append(res, res[k]*(n-k)/(k+1))
	}
	return res
}
