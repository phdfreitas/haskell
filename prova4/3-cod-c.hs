import Data.Char

-- =-=-= 3ª QUESTÃO LETRA A =-=-=
-- Função auxiliar que converter um char para minusculo
minusculaC :: Char -> Char
minusculaC x = (toLower x)

-- Função que converte letras minusculas para inteiros
let2int :: Char -> Int
let2int c = (ord (minusculaC c)) - 97

-- Função que converte um inteiro em um char
int2let :: Int -> Char
int2let c
    | c <= 25 = (minusculaC (chr (c + 97)))
    | otherwise = (minusculaC (chr (c - 26 + 97)))
-- =-=-= FIM 3ª QUESTÃO LETRA A =-=-=

-- =-=-= 3ª QUESTÃO LETRA B =-=-=
-- Função que faz um deslocamento em um dado char
shift :: Int -> Char -> Char
shift i c = int2let(let2int c + i)
-- =-=-= FIM 3ª QUESTÃO LETRA B =-=-=

-- =-=-= 3ª QUESTÃO LETRA C =-=-=
encode :: Int -> String -> String
encode i "" = ""
encode i (a:as) = shift i a : [] ++ encode i as
-- =-=-= FIM 3ª QUESTÃO LETRA C =-=-=