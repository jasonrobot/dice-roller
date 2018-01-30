module Main where

import Dice

main :: IO ()
main = do
    x <- roll 20 20
    print x
    return ()
