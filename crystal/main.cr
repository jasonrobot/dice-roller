# main.cr
require "random"

class Dice
    property amount : Int32, sides : Int32

    def initialize(line)
        x = _parse(line)
        @amount = x[0]
        @sides = x[1]
    end
    
    def _roll(amount, sides)
        "not implemented"
    end

    def roll
        _roll(@amount, @sides)
    end

    def _parse(line) : Array(Int32)
        [1, 4]
    end
end

d = Dice.new("1d4")
puts d.roll
