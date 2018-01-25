require "random"

class Dice
    property amount : Int32, sides : Int32

    def initialize(line)
        x = self.parse(line)
        @amount = x[0]
        @sides = x[1]
    end
    
    def do_roll(amount, sides)
        puts "would roll #{amount}d#{sides}"
        Array.new(amount) {rand(sides) + 1}
    end

    def self.roll
        do_roll(@amount, @sides)
    end

    def self.parse(line)
        result = line.split('d')
        if result.size == 1
            [1, result[0].to_i]
        else
            result.map &.to_i
        end
    end
end