-- Guardas
maxi :: Integer -> Integer -> Integer
maxi x y
    | x >= y    = x 
    | otherwise = y

maxTres :: Integer -> Integer -> Integer -> Integer
maxTres x y z
    | x >= y && x >= z  = x 
    | y >= z            = y
    | otherwise         = z

max' :: Integer -> Integer -> Integer
max' a b = if a >= b then a else b

-- Funções
addD a b    = 2 * (a+b)
addD b a    = 2 * (b+a)  

-- Cláusula where
-- Função sem parâmetro

sumDoubleSquare :: Int -> Int -> Int
sumDoubleSquare x y = dSqX + dSqY
    where   dSqX = 2 * (x * x)
            dSqY = 2 * (y * y)

-- Função com parâmetro
sumDoubleSquare2 :: Int -> Int -> Int
sumDoubleSquare2 x y = dSq x + dSq y 
    where   dSq n = 2 * (n * n)

-- let
sumSquares :: Int -> Int -> Int
sumSquares x y =    let sqX = x * x 
                        sqY = y * y
                    in sqX + sqY

-- Escopo
maxsq :: Int -> Int -> Int
maxsq x y
    | sqx > sqy = sqx 
    | otherwise = sqy 
        where 
            sqx = sq x
            sqy = sq y 
            sq :: Int -> Int
            sq z = z * z

-- Recursão
fat :: Integer -> Integer
fat n 
    | n == 0    = 1
    | n > 0     = fat (n - 1) * n 