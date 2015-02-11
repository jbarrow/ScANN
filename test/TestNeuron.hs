module TestNeuron where

import Test.Hspec
import Test.QuickCheck
import Data.Typeable
import Data.Char
import Numeric.LinearAlgebra
import qualified Control.Exception as E

import AI.DemoNeuron

testNeuron :: IO ()
testNeuron = hspec $ do
  describe "Sigmoid Neuron" $ do
    it "should be an instance of Show" $ do
      (typeOf $ show SigmoidNeuron) `shouldBe` typeRep ["Char"]

    it "should throw an exception with invalid inputs" $ do
      let n = SigmoidNeuron
      E.evaluate (evaluate n (fromList [1, 0]) (fromList [1]))
        `shouldThrow` anyException
