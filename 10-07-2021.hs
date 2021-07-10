-- Tuplas

intP :: (Int, Int)
intP = (33, 43)

charB :: (Char, Bool)
charB = ('A', True)

minAndMax :: Integer -> Integer -> (Integer, Integer)
minAndMax x y 
    | x >= y = (y, x)
    | otherwise = (x, y)

addPair :: (Integer, Integer) -> Integer
addPair (x, y) = x + y

addPair' :: (Integer, Integer) -> Integer
addPair' (0, y) = y 
addPair' (x, y) = x + y 

shift :: ((Integer, Integer), Integer) -> (Integer, (Integer, Integer))
shift ((x, y), z) = (x, (y, z))

addPair'' :: (Integer, Integer) -> Integer
addPair'' s = fst s + snd s

--
oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/(2.0*a)

twoRoots :: Float -> Float -> Float -> (Float, Float)
twoRoots a b c = (d-e, d+e)
    where 
        d = -b / (2.0*a)
        e = sqrt(b ^ 2 - 4.0*a*c) / (2.0*a)

roots :: Float -> Float -> Float -> String
roots a b c 
    | b ^ 2 == 4.0*a*c    = show(oneRoot a b c)
    | b ^ 2 > 4.0*a*c     = show f ++ " " ++ show s 
    | otherwise = "No Roots"
        where (f, s) = twoRoots a b c

-- Listas

-- Compreensão de Listas
eleva :: [Integer] -> [Integer]
eleva a = [2*n | n <- a]

zip' :: [t] -> [u] -> [(t, u)]
zip' (a:as) (b:bs) = (a, b):zip' as bs
zip' _ _ = []