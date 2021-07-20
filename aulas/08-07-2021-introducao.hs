-- Introdução ao Haskell

answer :: Integer
answer = 42

greater :: Bool 
greater = (answer > 71)

square :: Int -> Int
square x = x * x

eXor :: Bool -> Bool -> Bool
eXor x y = (x || y) && not (x && y)

tresIguais :: Integer -> Integer -> Integer -> Bool
tresIguais m n p = (m == n) && (n == p)

--
offset = fromEnum 'A' - fromEnum 'a'

maiuscula :: Char -> Char
maiuscula ch = toEnum (fromEnum ch + offset)

ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && (ch <= '9')
--
