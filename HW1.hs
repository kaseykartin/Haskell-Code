-- Casey Martin
-- ID: 11720762

module HW1 where

import Debug.Trace

-- SECTION 1: CUSTOM LIST OPERATIONS
--------------------------------------------------------------------------------------------------------------------------------------
dropList _ [] = [] -- If empty list is given, return empty list
dropList 0 xs = xs -- Return list when n = 0
dropList n (x:xs)
    | n > 0 = dropList (n-1) xs -- Iterate and decrease n by one
    | otherwise = xs -- Return list


splitAtIndex x [] = ([], []) -- If empty list is given, return one empty list plus an additional empty list for completely free
splitAtIndex 0 xs = ([], xs) -- if given index == 0, return one empty list and the original list
splitAtIndex n (x:xs) = (x : take (n-1) xs, drop n (x:xs)) -- Modified from take function in MathUtil, now returns two lists including second half


concatLists [] ys = ys -- If first list is empty, return second list
concatLists (x:xs) ys = x : concatLists xs ys -- Append each element of the list


interleaveLists [] ys = ys -- If first given list is empty, return second list
interleaveLists xs [] = xs -- If second given list is empty, return first list
interleaveLists (x:xs) (y:ys) = x : y : interleaveLists xs ys 
-- If both lists given are populated, recursively construct a list using x and y from the first and second lists respectively


-- SECTION 2: MERGING SORTED LISTS
--------------------------------------------------------------------------------------------------------------------------------
mergeAscending [] ys = ys -- If first given list is empty, return second list
mergeAscending xs [] = xs -- If second given list is empty, return first list
mergeAscending (x:xs) (y:ys)
    | x <= y = x : mergeAscending xs (y:ys) -- if x <= y, append x and recursive call
    | otherwise = y : mergeAscending (x:xs) ys -- otherwise, append y and recursive call


mergeDescending [] ys = ys -- If first given list is empty, return second list
mergeDescending xs [] = xs -- If second given list is empty, return first list
mergeDescending (x:xs) (y:ys) -- Same thing as mergeAscending but condition on x is flipped lol
    | x >= y = x : mergeDescending xs (y:ys)
    | otherwise = y : mergeDescending (x:xs) ys


-- SECTION 3: SORTING ALGORITHMS YIPPEEEEEEE
--------------------------------------------------------------------------------------------------------------------------------
len1 [] = 0
len1 (x:xs) = 1 + len1 xs -- Helper function to be used to find midpoint (technically not using 'length' even if vs insists this is the same thing)

mergeSort [] = [] -- Return an empty list for an empty list
mergeSort [x] = [x] -- A list with a single element returns a list with a single element
mergeSort xs = mergeAscending (mergeSort left) (mergeSort right)
    where (left, right) = splitAtIndex (len1 xs `div` 2) xs 
    -- Used the following site to figure this one out
    -- https://smthngsmwhr.wordpress.com/2012/11/09/sorting-algorithms-in-haskell/


-- Helper function for insertionSort
insert x [] = [x] -- Inserting something into an empty lists returns a list consisting of that one something
insert x (y:ys)
    | x <= y = x : y : ys -- If x is less than y, insert x before y
    | otherwise = y : insert x ys -- Otherwise iterate down the list and check again

insertionSort [] = [] -- Give an empty list for an empty list
insertionSort (x:xs) = insert x (insertionSort xs)