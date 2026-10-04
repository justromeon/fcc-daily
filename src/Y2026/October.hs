module Y2026.October where

import Data.Char (digitToInt, isUpper, isLower, isDigit)
import Data.Sequence (unfoldl)

-- Day 1
toDecimal :: String -> Int
toDecimal = foldl (\acc x -> acc * 2 + digitToInt x) 0

-- Day 2
toBinary :: Int -> String
toBinary 0 = "0"
toBinary n = concatMap show $ unfoldl (\x -> if x == 0 then Nothing else Just (divMod x 2)) n

-- Day 3
data Strength
  = Weak
  | Medium
  | Strong
  deriving (Eq, Show)

checkStrength :: String -> Strength
checkStrength = eval . sum . map fromEnum . sequence [isLongEnough, hasBothCases, hasNumber, hasSpecial]
  where
    isLongEnough = (>=8) . length
    hasBothCases = (&&) <$> any isLower <*> any isUpper
    hasNumber    = any isDigit
    hasSpecial   = any (`elem` "!@#$%^&*")
    eval n
      | n == 4 = Strong
      | n >= 2 = Medium
      | otherwise = Weak
