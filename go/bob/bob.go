package bob

import "strings"

const testVersion = 3

// Hey emulates Bob's responses
func Hey(message string) string {
	trimmedMessage := strings.TrimSpace(message)
	if trimmedMessage == "" {
		return "Fine. Be that way!"
	}
	if strings.ToUpper(trimmedMessage) == trimmedMessage && strings.ToLower(trimmedMessage) != trimmedMessage {
		return "Whoa, chill out!"
	}
	if strings.HasSuffix(trimmedMessage, "?") {
		return "Sure."
	}
	return "Whatever."
}
