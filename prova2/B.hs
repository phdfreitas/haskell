divisores :: Integer -> [Integer]
divisores n = [x | x <- [1..n], n `mod` x == 0]

ehPrimo :: Integer -> Bool
ehPrimo n = divisores n == [1,n]

fatores :: Integer -> [Integer]
fatores n = [x | x <- [1..n], ehPrimo x]

sumSquare :: [Integer] -> Integer
sumSquare [] = 0 
sumSquare (a:as) = (a * a) + sumSquare as