module Y2026.October where

import Data.Char (digitToInt)
import Data.Sequence (unfoldl)

-- Day 1
toDecimal :: String -> Int
toDecimal = foldl (\acc x -> acc * 2 + digitToInt x) 0

-- Day 2
toBinary :: Int -> String
toBinary 0 = "0"
toBinary n = concatMap show $ unfoldl (\x -> if x == 0 then Nothing else Just (divMod x 2)) n
