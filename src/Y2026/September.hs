module Y2026.September where

import Data.List
import Data.Ord
import Data.Char

getLongestWord :: String -> String
getLongestWord = maximumBy (comparing length) . reverse . words . filter (not . isPunctuation)
