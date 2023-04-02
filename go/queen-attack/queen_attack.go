package queenattack

import "errors"

const testVersion = 2

// Point represents point on the board
type Point struct {
	X, Y int
}

// CanQueenAttack returns whether queens can attack each other.
// Second returned value indicates whether check was successful.
func CanQueenAttack(pos1, pos2 string) (bool, error) {
	if len(pos1) != 2 || len(pos2) != 2 {
		return false, errors.New("Invalid position")
	}
	if !valid(pos1) || !valid(pos2) || pos1 == pos2 {
		return false, errors.New("Invalid position")
	}
	return canAttack(point(pos1), point(pos2)), nil
}

func valid(pos string) bool {
	return pos[0] >= 'a' && pos[0] <= 'h' && pos[1] >= '1' && pos[1] <= '8'
}

func point(pos string) Point {
	return Point{X: int(pos[0] - 'a'), Y: int(pos[1] - '1')}
}

func canAttack(pos1, pos2 Point) bool {
	return pos1.X == pos2.X || pos1.Y == pos2.Y || abs(pos1.X-pos2.X) == abs(pos1.Y-pos2.Y)
}

func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}
