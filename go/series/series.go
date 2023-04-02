package series

const testVersion = 2

// All returns all series of length n inside string s
func All(n int, s string) []string {
	if n > len(s) {
		return nil
	}
	res := []string{}
	for i := 0; i <= len(s)-n; i++ {
		res = append(res, s[i:i+n])
	}
	return res
}

// UnsafeFirst returns first serie of lngth n in string s
func UnsafeFirst(n int, s string) string {
	if n > len(s) {
		return ""
	}
	return s[0:n]
}

// First returns first serie of lngth n in string s and boolean to indicate success
func First(n int, s string) (string, bool) {
	if n > len(s) {
		return "", false
	}
	return s[0:n], true
}
