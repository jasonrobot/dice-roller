(ns dice-roller.core-test
  (:require [clojure.test :refer :all]
            [dice-roller.core :refer :all]))

; test rolling dice
;     roll should do things
;     should not allow things like d-6, d0, or d > 2**16
;     should return values between 1 and the number of sides on the dice

; testing parsing string
;     in ideal usage, should return a 2-tuple of (amount, sides)
;     should assume that if there is no amount specified, roll 1
;     should raise an exception if no sides arg given

; test integration of units
;     test that the results of parsing can be interpreted by roll

(deftest test-roll
  (testing "rolls dice"
    (is (some? (roll 3 4))))
  (testing "rejects invalid amounts of dice"
    (is (nil? (roll -3 4))))
  (testing "rejects invalid types of dice"
    (is (nil? (roll 3 -4))))
  (testing "returns values between 1 and number of sides"
    (is (every? #(and (<= % 4) (>= % 1)) (roll 100 4)))))

(deftest test-parse
  (testing "parses to a list"
    (is (parse "3d5") [3 5]))
  (testing "result length is 2"
    (is (= (count (parse "3d5")) 2)))
  (testing "amount defaults to 1"
    (is (= ((parse "d20") 0) 1)))
  (testing "throws an exception if no sides are given"
    (is (parse "10d"))))
    