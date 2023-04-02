package leap

const testVersion = 3

// IsLeapYear returns true if given year is leap, false otherwise.
func IsLeapYear(y int) bool {
	if y%4 == 0 {
		if y%100 == 0 {
			return y%400 == 0
		}
		return true
	}
	return false
}
