import HW1

main = do
    putStrLn("Running mergeAscending on [1,3,5] & [2,4,6]: " ++ show (mergeAscending [1,3,5] [2,4,6]))
    putStrLn("Running mergeAscending on [1,3,5] & []: " ++ show (mergeAscending [1,3,5] []))
    putStrLn("Running mergeAscending on [] & [2,4,6]: " ++ show (mergeAscending [] [2,4,6]))

    putStrLn("Running mergeDescending on [5,3,1] & [6,4,2]: " ++ show (mergeDescending [5,3,1] [6,4,2]))
    putStrLn("Running mergeDescending on [5,3,1] & []: " ++ show (mergeDescending [5,3,1] []))
    putStrLn("Running mergeDescending on [] & [6,4,2]: " ++ show (mergeDescending [] [6,4,2]))

    putStrLn("Running mergeSort on [4,1,3,2]" ++ show (mergeSort[4,1,3,2]))
    putStrLn("Running mergeSort on []" ++ mergeSort[])

    putStrLn("Running insertionSort on [4,1,3,2]" ++ show (insertionSort[4,1,3,2]))
    putStrLn("Running insertionSort on []" ++ insertionSort[])

    -- Couldnt figure out how to get this to actually run but I tested all this in console and it worked so it stays