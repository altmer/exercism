package twelve

import (
	"fmt"
	"strings"
)

const testVersion = 1

var numbers = []string{"first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"}
var gifts = []string{"twelve Drummers Drumming", "eleven Pipers Piping", "ten Lords-a-Leaping", "nine Ladies Dancing", "eight Maids-a-Milking", "seven Swans-a-Swimming", "six Geese-a-Laying", "five Gold Rings", "four Calling Birds", "three French Hens", "two Turtle Doves", "and a Partridge in a Pear Tree"}

// Verse returns specific verse of the song
func Verse(input int) string {
	return fmt.Sprintf("On the %s day of Christmas my true love gave to me, %s.", numbers[input-1], allGifts(input))
}

// Song returns whole song
func Song() string {
	song := ""
	for i := 1; i <= len(numbers); i++ {
		song += Verse(i) + "\n"
	}
	return song
}

func allGifts(input int) string {
	if input == 1 {
		return "a Partridge in a Pear Tree"
	}
	return strings.Join(gifts[len(gifts)-input:], ", ")
}
