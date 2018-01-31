module Main where

import Dice

main :: IO ()
main = do
    x <- uncurry roll $ parse "2d12"
    print x
    return ()
