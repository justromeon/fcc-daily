module Y2026.SeptemberSpec (spec) where

import Test.Hspec
import Y2026.September

spec :: Spec
spec = describe "Y2026.September" $ do
  describe "Day 29 getLongestWord" $ do
    it "returns 'coding' for 'coding is fun'" $ do
      getLongestWord "coding is fun" `shouldBe` "coding"

    it "returns 'educational' for 'Coding challenges are fun and educational.'" $ do
      getLongestWord "Coding challenges are fun and educational." `shouldBe` "educational"

    it "returns 'sentence' for 'This sentence has multiple long words.'" $ do
      getLongestWord "This sentence has multiple long words." `shouldBe` "sentence"

  describe "Day 30 formatNumber" $ do
    it "returns '+0 (555) 234-0182' for '05552340182'" $ do
      formatNumber "05552340182" `shouldBe` "+0 (555) 234-0182"

    it "returns '+1 (555) 435-4792' for '15554354792'" $ do
      formatNumber "15554354792" `shouldBe` "+1 (555) 435-4792"
