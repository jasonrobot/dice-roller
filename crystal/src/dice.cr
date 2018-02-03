require "random"

module Roller

def do_roll(amount, sides)
    # puts "would roll #{amount}d#{sides}"
    Array.new(amount) {rand(sides) + 1}
end

def parse(line) : {Int32, Int32}
    # result = line.split('d')
    result = /^(\d*)d(\d+)$/.match(line)

    if result.nil?
        raise "unable to parse"
    end

    if (result[1] == "")
        {1, result[2].to_i}
    else
        {result[1].to_i, result[2].to_i}
    end
end


class Dice
    include Roller

    property amount : Int32, sides : Int32
    
    def initialize(line)
        x = parse(line)
        @amount = (x[0] || 0)
        @sides = (x[1] || 0)
    end

    def roll
        do_roll(@amount, @sides)
    end
    
end #class

end #module