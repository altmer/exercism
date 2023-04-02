package isogram

import (
	"strings"
	"unicode"
)

const testVersion = 1

// IsIsogram returns whether given word is isogram
func IsIsogram(word string) bool {
	occured := map[rune]bool{}
	for _, r := range strings.ToLower(word) {
		if !unicode.IsLetter(r) {
			continue
		}
		if occured[r] {
			return false
		}
		occured[r] = true
	}
	return true
}
