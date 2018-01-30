module Dice
    ( roll
    , roll_one
    ) where

import System.Random

roll_one :: Int -> IO Int
roll_one sides =
    randomRIO (1 :: Int, (sides + 1))

roll :: Int -> Int -> IO [Int]
roll amount sides
    | amount == 0 = sequence [roll_one sides]
    | otherwise = sequence $ replicate amount $ roll_one sides