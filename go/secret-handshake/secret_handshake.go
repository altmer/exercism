package secret

const testVersion = 1

func reverse(slice []string) []string {
	for i := len(slice)/2 - 1; i >= 0; i-- {
		opp := len(slice) - 1 - i
		slice[i], slice[opp] = slice[opp], slice[i]
	}
	return slice
}

// Handshake returns "secret handshake" representation of given number.
func Handshake(code uint) []string {
	res := []string{}
	if code&1 != 0 {
		res = append(res, "wink")
	}
	if code&2 != 0 {
		res = append(res, "double blink")
	}
	if code&4 != 0 {
		res = append(res, "close your eyes")
	}
	if code&8 != 0 {
		res = append(res, "jump")
	}
	if code&16 != 0 {
		return reverse(res)
	}
	return res
}
