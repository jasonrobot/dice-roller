# main.cr
require "random"
require "./dice.cr"

d = Dice.new("20d4")
puts d.roll
