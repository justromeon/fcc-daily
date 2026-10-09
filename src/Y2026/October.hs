{-# LANGUAGE TupleSections #-}
module Y2026.October where

import Data.Char (digitToInt, isUpper, isLower, isDigit)
import Data.Sequence (unfoldl)
import Data.List (findIndex, sortOn)
import Data.Map qualified as Map
import Data.Map (Map)
import Data.Vector ((!?))
import Data.Vector qualified as V
import Data.Maybe (listToMaybe, mapMaybe)

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

-- Day 4
data StellarClass
  = O | B | A | F | G | K | M
  deriving (Eq, Show, Enum)

classification :: (Num a, Ord a) => a -> StellarClass
classification temp
  = maybe M toEnum
  $ findIndex (temp>=) [30000, 10000, 7500, 6000, 5200, 3700]

-- Day 5
hasExoplanet :: String -> Bool
hasExoplanet reading = any isLessThanThreshold reading
  where
    isLessThanThreshold = maybe False (<= mean*0.8) . flip Map.lookup luminosityLevels
    mean  =  total / (fromIntegral $ length reading)
    total = sum $ map (flip (Map.findWithDefault 0) luminosityLevels) reading

luminosityLevels :: Map Char Double
luminosityLevels = Map.fromList $ zip (['0'..'9']++['A'..'Z']) [0..]

-- Day 6
sendMessage :: [Double] -> Double
sendMessage distances = roundTo4 (travelTime + totalDelay)
  where
    totalDelay = (*0.5) . pred . fromIntegral $ length distances
    travelTime = sum $ map (/messageSpeed) distances
    messageSpeed = 300000
    roundTo4 x = fromIntegral (round (x * 10000) :: Integer) / 10000

-- Day 7
type Position = (Int, Int)

findLandingSpot :: [[Int]] -> Maybe Position
findLandingSpot m =
  listToMaybe $ sortOn danger [(r, c) | (r, row) <- zip [0..] m, (c, x) <- zip [0..] row, x == 0]
  where
    vector2d = V.fromList (map V.fromList m)
    danger (r, c) = sum $ mapMaybe (\(i, j) -> vector2d !? i >>= (!? j))
      [(r-1, c), (r+1, c), (r, c-1), (r, c+1)]
