module SumOfN where

add x y = x + y

sumOfN :: (Eq t, Num t) => t -> t
sumOfN 0 = 0
sumOfN n = n + sumOfN (n - 1)

main :: IO ()
main = do
    let res = add 1 2
    putStrLn ("sum = " ++ show res)
    

