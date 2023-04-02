package hamming

import "errors"

const testVersion = 6

// Distance returns Hammock distance between DNA strands.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("Strings lengths are different")
	}
	distance := 0
	for i := range a {
		if a[i] != b[i] {
			distance++
		}
	}
	return distance, nil
}
