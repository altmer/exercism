package etl

import "strings"

const testVersion = 1

// Transform transforms old rules format to the new one
func Transform(old map[int][]string) map[string]int {
	res := map[string]int{}
	for score, letters := range old {
		for _, letter := range letters {
			res[strings.ToLower(letter)] = score
		}
	}
	return res
}
