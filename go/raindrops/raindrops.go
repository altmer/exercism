package raindrops

import (
  "strconv"
  "fmt"
)

const testVersion = 3

// Convert converts number to string using raindrop rules
func Convert(x int) string {
  str := fmt.Sprintf("%s%s%s", pling(x), plang(x), plong(x))
  if len(str) == 0 {
    return strconv.Itoa(x)
  }
  return str
}

func pling(x int) string {
  if x % 3 == 0 {
    return "Pling"
  }
  return ""
}

func plang(x int) string {
  if x % 5 == 0 {
    return "Plang"
  }
  return ""
}

func plong(x int) string {
  if x % 7 == 0 {
    return "Plong"
  }
  return ""
}
