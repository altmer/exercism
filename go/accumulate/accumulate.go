package accumulate

const testVersion = 1

// Accumulate maps given input array with given function
func Accumulate(input []string, fn func(string) string) []string {
  result := make([]string, len(input))
  for i, value := range(input) {
    result[i] = fn(value)
  }
  return result
}
