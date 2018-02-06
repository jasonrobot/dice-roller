package dice

import (
	"math/rand"
	"strconv"
	"strings"
)

// Dice represents dice
type Dice struct {
	Amount int
	Sides  int
}

// Roll the dice!
func (d Dice) Roll() []int {
	return roll(d.Amount, d.Sides)
}

// FromString returns X Y-sided dice from a string "xdy"
func FromString(line string) Dice {
	a, s := parse(line)
	return Dice{a, s}
}

func roll(amount int, sides int) (results []int) {
	results = make([]int, amount)
	for k := range results {
		results[k] = rand.Intn(sides) + 1
	}
	return
}

func parse(line string) (amount, sides int) {
	split := strings.Split(line, "d")
	if split[0] == "" {
		split[0] = "1"
	}
	amount, _ = strconv.Atoi(split[0])
	sides, _ = strconv.Atoi(split[1])
	return
}
