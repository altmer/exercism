package summultiples

const testVersion = 1

func SumMultiples(limit int, divisors ...int) int {
	counted := map[int]bool{}
	sum := 0
	for _, divisor := range divisors {
		sum += countSum(divisor, limit, counted)
	}
	return sum
}

func countSum(divisor, limit int, counted map[int]bool) int {
	res := 0
	for num := divisor; num < limit; num += divisor {
		if counted[num] {
			continue
		}
		res += num
		counted[num] = true
	}
	return res
}
