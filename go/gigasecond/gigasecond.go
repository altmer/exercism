package gigasecond

// import path for the time package from the standard library
import "time"

const testVersion = 4

// AddGigasecond adds 10^9 seconds to the given time.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Duration(1000000000) * time.Second)
}
