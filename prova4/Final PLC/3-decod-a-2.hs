import Data.Char

-- =-=-= 4ª QUESTÃO LETRA A PARTE 1 =-=-=
percent :: Int -> Int -> Float
percent a b = ((fromIntegral a :: Float) / (fromIntegral b :: Float)) * 100
-- =-=-= FIM 4ª QUESTÃO LETRA A PARTE 1 =-=-=

-- =-=-= 4ª QUESTÃO LETRA A PARTE 2 =-=-=
-- Função auxiliar para retorar a string completamente minuscula
minuscula :: String -> String
minuscula [] = ""
minuscula (a:as) = (toLower a) : minuscula as

-- Na própria função freqs conta os caractereres de uma string e aplico a função percent diretamente
freqs :: String -> [Float]
freqs s = [(percent (snd (x,c)) (length s)) | x <- ['a'..'z'], let c = (length.filter (==x)) (minuscula s)]
-- =-=-= FIM 4ª QUESTÃO LETRA A PARTE 2 =-=-=
