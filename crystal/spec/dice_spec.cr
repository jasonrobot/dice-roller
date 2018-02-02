require "spec"
require "../src/dice.cr"

include Roller

describe "Dice" do
    describe "roll" do
        it "should not allow negative numbers" do
            expect_raises Exception do 
                do_roll -3, 4
            end
        end

        it "should return values between 1 and the number of sides on the dice" do
            result = do_roll 100, 3
            [1, 2, 3].each do |x|
                result.includes?(x).should eq true
            end
            [0, 4].each do |x|
                result.includes?(x).should eq false
            end
        end
    end

    describe "parse" do
        it "should return a 2-tuple of (amount, sides)" do
            result = parse("2d3")
            result.should eq({2, 3})
        end

        it "should assume that if there is no amount specified, roll 1" do
            result = parse("d20")
            result[0].should eq 1
        end

        it "should raise an exception if no sides arg given" do
            expect_raises Exception do 
                parse("qwe")
            end
        end
    end

    describe "integration" do
        it "should be able to pass the results of parse to roll" do
        end
    end
end