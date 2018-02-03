# main.cr
require "random"
require "./dice.cr"

include Roller

d = Dice.new("20d4")
puts d.roll
