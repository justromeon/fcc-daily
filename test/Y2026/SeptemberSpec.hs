module Y2026.SeptemberSpec (spec) where

import Test.Hspec
import Y2026.September (getLongestWord)

spec :: Spec
spec = describe "Y2026" $ do
  describe "September" $ do
    describe "getLongestWord" $ do
      it "returns 'coding' for 'coding is fun'" $ do
        getLongestWord "coding is fun" `shouldBe` "coding"

      it "returns 'educational' for 'Coding challenges are fun and educational.'" $ do
        getLongestWord "Coding challenges are fun and educational." `shouldBe` "educational"

      it "returns 'sentence' for 'This sentence has multiple long words.'" $ do
        getLongestWord "This sentence has multiple long words." `shouldBe` "sentence"
