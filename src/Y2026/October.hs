module Y2026.October where

import Data.Char (digitToInt)

-- Day 1
toDecimal :: String -> Int
toDecimal = foldl (\acc x -> acc * 2 + digitToInt x) 0
