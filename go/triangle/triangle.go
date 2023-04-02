package triangle

import (
	"math"
)

const testVersion = 3

// KindFromSides returns kind of the given triangle based on side lengths.
func KindFromSides(a, b, c float64) Kind {
	switch {
	case math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c):
		return NaT
	case math.IsInf(a, 0) || math.IsInf(b, 0) || math.IsInf(c, 0):
		return NaT
	case a <= 0 || b <= 0 || c <= 0:
		return NaT
	case (a+b) < c || (a+c) < b || (b+c) < a:
		return NaT
	case a == b && a == c:
		return Equ
	case a == b || a == c || b == c:
		return Iso
	}
	return Sca
}

// Kind is a type of triangle
type Kind string

// NaT not a triangle
var NaT = Kind("NaT")

// Equ equilateral
var Equ = Kind("Equ")

// Iso isosceles
var Iso = Kind("Iso")

// Sca scalene
var Sca = Kind("Sca")
