package grains

import "errors"

const testVersion = 1

// Square returns number of grains on chess square number "n".
func Square(n int) (uint64, error) {
	if n < 1 || n > 64 {
		return 0, errors.New("N is not in the valid range [1, 64]")
	}
	return pow2(n), nil
}

// Total returns total number of grains on chessboard
func Total() uint64 {
	res := uint64(0)
	for i := 1; i <= 64; i++ {
		if sq, err := Square(i); err != nil {
			panic(err)
		} else {
			res += sq
		}
	}
	return res
}

func pow2(n int) uint64 {
	res := uint64(1)
	for i := 0; i < n-1; i++ {
		res *= 2
	}
	return res
}
