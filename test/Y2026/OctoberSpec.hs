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
