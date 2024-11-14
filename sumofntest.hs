module SumOfNTest where

import SumOfN
import Test.HUnit

addTest = TestCase (assertEqual "add testing" 2 (add 1 1))

sumOfNTest1 = TestCase (assertEqual "sumofNTesting" 10 (sumOfN 4))

tests = TestList [addTest, sumOfNTest1]

run = runTestTT tests