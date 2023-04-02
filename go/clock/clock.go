package clock

import "fmt"

const testVersion = 4

// Clock represents time without date
type Clock struct {
	hour   int // current hour
	minute int // current minutes
}

// New returns new instance of Clock for given hour and minute values
func New(hour, minute int) Clock {
	hoursInMinutes := minute / 60
	minutesRem := minute % 60
	if minutesRem < 0 {
		minutesRem += 60
		hoursInMinutes--
	}
	hoursRem := (hour + hoursInMinutes) % 24
	if hoursRem < 0 {
		hoursRem += 24
	}
	return Clock{hoursRem, minutesRem}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hour, c.minute)
}

// Add adds specified number of minutes to the clock
func (c Clock) Add(minutes int) Clock {
	minutes = c.minute + minutes
	hoursInMinutes := minutes / 60
	minutesNew := minutes % 60
	if minutesNew < 0 {
		minutesNew += 60
		hoursInMinutes--
	}
	hoursNew := (c.hour + hoursInMinutes) % 24
	if hoursNew < 0 {
		hoursNew += 24
	}
	return Clock{hoursNew, minutesNew}
}
