require "spec"
require "../src/dice.cr"

describe "Dice" do
    describe "roll" do
        it "should not allow negative numbers" do

        end

        it "should return values between 1 and the number of sides on the dice" do
            
        end
    end

    describe "parse" do
        it "should return a 2-tuple of (amount, sides)" do
        end

        it "should assume that if there is no amount specified, roll 1" do
        end

        it "should raise an exception if no sides arg given" do
        end
    end

    describe "integration" do
        it "should be able to pass the results of parse to roll" do
        end
    end
end