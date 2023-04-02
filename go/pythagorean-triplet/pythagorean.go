package pythagorean

const testVersion = 1

type Triplet [3]int

// Range returns a list of all Pythagorean triplets with sides in the
// range min to max inclusive.
func Range(min, max int) []Triplet {
	res := []Triplet{}
	for a := min; a <= max; a++ {
		for b := a; b <= max; b++ {
			for c := b; c <= max; c++ {
				if isTriplet(a, b, c) {
					res = append(res, Triplet{a, b, c})
				}
			}
		}
	}
	return res
}

// Sum returns a list of all Pythagorean triplets where the sum a+b+c
// (the perimeter) is equal to p.
func Sum(p int) []Triplet {
	res := []Triplet{}
	for a := 1; a <= p; a++ {
		for b := a; b <= p; b++ {
			c := p - a - b
			if c > 0 && isTriplet(a, b, c) {
				res = append(res, Triplet{a, b, c})
			}
		}
	}
	return res
}

func isTriplet(a, b, c int) bool {
	return a*a+b*b == c*c
}
