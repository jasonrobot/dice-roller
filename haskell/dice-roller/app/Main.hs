module Main where

import Dice
import System.IO

intsToStr :: [Int] -> String
intsToStr list = do 
    "[" ++ (foldr (\acc x -> acc ++ ", " ++ x) "" (map show $ init list)) ++ (show $ last list) ++ "]"

--- doRoll Handles calling parse, unpacking its result, and 
doRoll :: String -> String
doRoll line = do
    case parse line of
        Nothing -> "Could not parse: " ++ line
        Just (a, s) -> do
            x <- roll a s
            --x <- [[1, 2, 3]]
            --let x = [1, 2, 3]
            intsToStr [x]

main :: IO ()
main = do
    putStr . show $ "Enter dice to roll: "
    hFlush stdout
    line <- getLine
    case line of
        "q" -> return ()
        "quit" -> return ()
        str -> do
            -- x <- roll 5 1
            -- print x
            print $ doRoll str
            main
