-- Casey Martin
-- SID: 11720762

module HW2 where

-- PART ONE: DATA TYPES---------------------------------------------------------------------

-- currency data type with two constructors
data Currency = USD Double | INR Double
    deriving (Show)

-- conversion functions to convert between USD and INR using fixed rates
convertToUSD (USD x) = USD x
convertToUSD (INR x) = USD (x / 82)

convertToINR (INR x) = INR x
convertToINR (USD x) = INR (x * 82)

-- helper function for comparing node values
compareUSD (USD x) = x
compareUSD (INR x) = x / 82


-- PART TWO: BINARY SEARCH TREE-------------------------------------------------------------

-- Binary search tree to store our currency values
data BST a = Empty | Node a (BST a) (BST a)
    deriving (Show, Eq) -- So that we can print the tree

-- simple insertion function for our BST
insert x Empty = Node x Empty Empty
insert x (Node val left right)
    | compareUSD x < compareUSD val = Node val (insert x left) right
    | otherwise = Node val left (insert x right)


-- PART THREE: SEARCHING FOR A VALUE--------------------------------------------------------

-- function to searc for a specific currency value
search _ Empty = False -- return false when searching within an empty tree
search x (Node val left right) 
    | compareUSD x == compareUSD val = True -- Value found
    | compareUSD x < compareUSD val = search x left -- search left subtree
    | otherwise = search x right -- search right subtree


-- PART FOUR: SUMMING CURRENCY VALUES-------------------------------------------------------

-- function to calculate total value of tree in USD
sumTree Empty = 0 -- Empty tree has a total value of zero
sumTree (Node val left right) = 
    compareUSD val + sumTree left + sumTree right


-- PART FIVE: CONVERTING THE TREE-----------------------------------------------------------

convertTree _ Empty = Empty
convertTree f (Node val left right) = -- takes convert function and applies to tree using DFS
    Node (f val) (convertTree f left) (convertTree f right)


-- PART SIX: FUNCTORS AND FMAP--------------------------------------------------------------

instance Functor BST where
    fmap _ Empty = Empty
    fmap f (Node val left right) = Node (f val) (fmap f left) (fmap f right)

fconvertAllUSD t = convertToUSD `fmap` t

fconvertAllINR t = convertToINR `fmap` t

