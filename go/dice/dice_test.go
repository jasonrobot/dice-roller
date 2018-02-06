package dice

import (
	"testing"
)

func TestNothing(t *testing.T) {
	x := FromString("1d4")
	if x.Amount != 1 || x.Sides != 4 {
		t.Error("Dice was not created correctly")
	}
}

// test the roll method
func TestRoll(t *testing.T) {
	// roll should do things
	// should not allow things like d-6, d0, or d > 2**16
	// should return values between 1 and the number of sides on the dice
}

// testing the parse_dice method of main
func TestParse(t *testing.T) {
	// in ideal usage, should return a 2-tuple of (amount, sides)
	// should assume that if there is no amount specified, roll 1
	// should raise an exception if no sides arg given
}

// test the integration of our units
func TestIntegration(t *testing.T) {
	// test that the results of parsing can be interpreted by roll
}
