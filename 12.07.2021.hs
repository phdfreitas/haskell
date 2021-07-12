-- Funções de Alta Ordem

double :: [Int] -> [Int]
double [] = []
double (a:xs) = (2*a) : double xs

sqrList :: [Int] -> [Int]
sqrList [] = []
sqrList (a:x) = (a*a) : sqrList x 

times2 :: Int -> Int
times2 n = 2 * n 

sqr :: Int -> Int
sqr n = n * n 

-- Filter
ehPar :: Integer -> Bool
ehPar x = (x `mod` 2 == 0)

pares :: [Integer] -> [Integer]
pares a = filter ehPar a 

-- Folder

sumList :: [Int] -> Int
sumList [x] = x
sumList (a:as) = a + sumList as 