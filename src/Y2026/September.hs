module Y2026.September where

import Data.List (maximumBy)
import Data.Ord (comparing)
import Data.Char (isPunctuation)
import Text.Printf (printf)

-- Day 29
getLongestWord :: String -> String
getLongestWord = maximumBy (comparing length) . reverse . words . filter (not . isPunctuation)

-- Day 30
formatNumber :: String -> String
formatNumber (a:b:c:d:e:f:g:rest) = printf "+%c (%s) %s-%s" a [b,c,d] [e,f,g] rest
formatNumber _ = "Invalid"
