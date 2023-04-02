package pangram

import (
	"regexp"
	"strings"
)

const testVersion = 1

// IsPangram return true if given string is a pangram, false otherwise
func IsPangram(input string) bool {
	regex := regexp.MustCompile("[^a-z]")
	lower := strings.ToLower(input)
	letters := regex.ReplaceAllString(lower, "")

	lettersMap := make(map[rune]bool)
	for _, letter := range letters {
		lettersMap[letter] = true
	}
	for letter := 'a'; letter <= 'z'; letter++ {
		if !lettersMap[letter] {
			return false
		}
	}
	return true
}
