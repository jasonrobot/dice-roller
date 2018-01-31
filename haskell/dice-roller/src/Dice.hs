module Dice
    ( roll
    , parse
    ) where

import System.Random
import Text.Regex.PCRE

roll_one :: Int -> IO Int
roll_one sides =
    randomRIO (1 :: Int, (sides))

roll :: Int -> Int -> IO [Int]
roll 0 sides = sequence [roll_one sides]
roll amount sides = sequence $ replicate amount $ roll_one sides
-- roll amount sides
--     | amount == 0 = sequence [roll_one sides]
--     | otherwise = sequence $ replicate amount $ roll_one sides

parse :: String -> (Int, Int)
parse line =
    let [amount, sides] = tail $ ( line =~ "^(\\d*)d(\\d+)$" ) !! 0
    in (read amount, read sides)