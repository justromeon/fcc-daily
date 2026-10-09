module Y2026.OctoberSpec where

import Test.Hspec
import Y2026.October

spec :: Spec
spec = do
  describe "Day 1 toDecimal" $ do
    it "returns 5 for '101'" $ do
      toDecimal "101" `shouldBe` 5
    it "returns 10 for '1010'" $ do
      toDecimal "1010" `shouldBe` 10
    it "returns 18 for '10010'" $ do
      toDecimal "10010" `shouldBe` 18
    it "returns 85 for '1010101'" $ do
      toDecimal "1010101" `shouldBe` 85

  describe "Day 2 toBinary" $ do
    it "returns '101' for 5" $ do
      toBinary 5 `shouldBe` "101"
    it "returns '1100' for 12" $ do
      toBinary 12 `shouldBe` "1100"
    it "returns '110010' for 50" $ do
      toBinary 50 `shouldBe` "110010"
    it "returns '1100011' for 99" $ do
      toBinary 99 `shouldBe` "1100011"

  describe "Day 3 checkStrength" $ do
    it "returns Weak for \"123456\"" $ do
      checkStrength "123456" `shouldBe` Weak
    it "returns Weak for \"pass!!!\"" $ do
      checkStrength "pass!!!" `shouldBe` Weak
    it "returns Weak for \"Qwerty\"" $ do
      checkStrength "Qwerty" `shouldBe` Weak
    it "returns Weak for \"PASSWORD\"" $ do
      checkStrength "PASSWORD" `shouldBe` Weak
    it "returns Medium for \"PASSWORD!\"" $ do
      checkStrength "PASSWORD!" `shouldBe` Medium
    it "returns Medium for \"PassWord%^!\"" $ do
      checkStrength "PassWord%^!" `shouldBe` Medium
    it "returns Medium for \"qwerty12345\"" $ do
      checkStrength "qwerty12345" `shouldBe` Medium
    it "returns Strong for \"S3cur3P@ssw0rd\"" $ do
      checkStrength "S3cur3P@ssw0rd" `shouldBe` Strong
    it "returns Strong for \"C0d3&Fun!\"" $ do
      checkStrength "C0d3&Fun!" `shouldBe` Strong

  describe "Day 4 classification" $ do
    it "returns G for 5778" $ do
      classification (5778 :: Int) `shouldBe` G
    it "returns M for 2400" $ do
      classification (2400 :: Double) `shouldBe` M
    it "returns A for 9999" $ do
      classification (9999 :: Float) `shouldBe` A
    it "returns K for 3700" $ do
      classification (3700 :: Integer) `shouldBe` K
    it "returns M for 3699" $ do
      classification (3699 :: Int) `shouldBe` M
    it "returns O for 210000" $ do
      classification (210000 :: Double) `shouldBe` O
    it "returns F for 6000" $ do
      classification (6000 :: Float) `shouldBe` F
    it "returns B for 11432" $ do
      classification (11432 :: Integer) `shouldBe` B

  describe "Day 5 hasExoplanet" $ do
    it "returns False for \"665544554\"" $ do
      hasExoplanet "665544554" `shouldBe` False
    it "returns True for \"FGFFCFFGG\"" $ do
      hasExoplanet "FGFFCFFGG" `shouldBe` True
    it "returns False for \"MONOPLONOMONPLNOMPNOMP\"" $ do
      hasExoplanet "MONOPLONOMONPLNOMPNOMP" `shouldBe` False
    it "returns True for \"FREECODECAMP\"" $ do
      hasExoplanet "FREECODECAMP" `shouldBe` True
    it "returns False for \"9AB98AB9BC98A\"" $ do
      hasExoplanet "9AB98AB9BC98A" `shouldBe` False
    it "returns True for \"ZXXWYZXYWYXZEGZXWYZXYGEE\"" $ do
      hasExoplanet "ZXXWYZXYWYXZEGZXWYZXYGEE" `shouldBe` True

  describe "Day 6 sendMessage" $ do
    it "returns 2.5 for [300000, 300000]" $ do
      sendMessage [300000, 300000] `shouldBe` 2.5
    it "returns 3.0627 for [384400, 384400]" $ do
      sendMessage [384400, 384400] `shouldBe` 3.0627
    it "returns 364.5 for [54600000, 54600000]" $ do
      sendMessage [54600000, 54600000] `shouldBe` 364.5
    it "returns 1674.3333 for [1000000, 500000000, 1000000]" $ do
      sendMessage [1000000, 500000000, 1000000] `shouldBe` 1674.3333
    it "returns 2.4086 for [10000, 21339, 50000, 31243, 10000]" $ do
      sendMessage [10000, 21339, 50000, 31243, 10000] `shouldBe` 2.4086
    it "returns 21.1597 for [802101, 725994, 112808, 3625770, 481239]" $ do
      sendMessage [802101, 725994, 112808, 3625770, 481239] `shouldBe` 21.1597

  describe "Day 7 findLandingSpot" $ do
    it "returns Just (0, 1) for [[1, 0], [2, 0]]" $ do
      findLandingSpot [[1, 0], [2, 0]] `shouldBe` Just (0, 1)
    it "returns Just (1, 1) for [[9, 0, 3], [7, 0, 4], [8, 0, 5]]" $ do
      findLandingSpot [[9, 0, 3], [7, 0, 4], [8, 0, 5]] `shouldBe` Just (1, 1)
    it "returns Just (2, 2) for [[1, 2, 1], [0, 0, 2], [3, 0, 0]]" $ do
      findLandingSpot [[1, 2, 1], [0, 0, 2], [3, 0, 0]] `shouldBe` Just (2, 2)
    it "returns Just (2, 1) for a 4x4 grid" $ do
      findLandingSpot [[9, 6, 0, 8], [7, 1, 1, 0], [3, 0, 3, 9], [8, 6, 0, 9]] `shouldBe` Just (2, 1)
    it "returns Nothing for an empty grid" $ do
      findLandingSpot [] `shouldBe` Nothing
    it "returns Nothing when no valid landing spot exists" $ do
      findLandingSpot [[1, 2], [3, 4]] `shouldBe` Nothing
