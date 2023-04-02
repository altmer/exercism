package letter

const testVersion = 1

// FreqMap is a frequency map for letters
type FreqMap map[rune]int

// Frequency counts frequency map for given text
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

// ConcurrentFrequency counts frequency map for given array of texts concurrently
func ConcurrentFrequency(texts []string) FreqMap {
	freqMaps := make(chan FreqMap)
	for _, text := range texts {
		go func(s string) {
			freqMaps <- Frequency(s)
		}(text)
	}
	res := FreqMap{}
	for i := 0; i < len(texts); i++ {
		routineResult := <-freqMaps
		merge(&res, &routineResult)
	}
	return res
}

func merge(to, from *FreqMap) {
	for k, v := range *from {
		(*to)[k] = (*to)[k] + v
	}
}
