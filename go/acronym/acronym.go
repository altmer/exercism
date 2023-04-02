package acronym

import "strings"

const testVersion = 2

// Abbreviate abbreviates given phrase
func Abbreviate(phrase string) string {
	uppercased := strings.Title(phrase)
	words := strings.Fields(uppercased)
	res := ""
	for _, word := range words {
		if strings.ToUpper(word) == word {
			res += string(word[0])
		} else {
			res += capitals(word)
		}
	}
	return res
}

func capitals(word string) string {
	res := ""
	for _, letter := range word {
		if letter >= 'A' && letter <= 'Z' {
			res += string(letter)
		}
	}
	return res
}
