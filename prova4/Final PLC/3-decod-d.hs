import Data.Char

-- =-=-= 3ª QUESTÃO LETRA A =-=-=
minusculaC :: Char -> Char
minusculaC x = (toLower x)

let2int :: Char -> Int
let2int c = (ord (minusculaC c)) - 97

int2let :: Int -> Char
int2let c
    | c <= 25 = (minusculaC (chr (c + 97)))
    | otherwise = (minusculaC (chr (c - 26 + 97)))
-- =-=-= FIM 3ª QUESTÃO LETRA A =-=-=

-- =-=-= 3ª QUESTÃO LETRA B =-=-=
shift :: Int -> Char -> Char
shift i ' ' = ' '
shift i c = int2let(let2int c + i)
-- =-=-= FIM 3ª QUESTÃO LETRA B =-=-=

-- =-=-= 3ª QUESTÃO LETRA C =-=-=
encode :: Int -> String -> String
encode i "" = ""
encode i (a:as) = shift i a : [] ++ encode i as
-- =-=-= FIM 3ª QUESTÃO LETRA C =-=-=

-- =-=-= 4ª QUESTÃO LETRA A PARTE 1 =-=-=
percent :: Int -> Int -> Float
percent a b = ((fromIntegral a :: Float) / (fromIntegral b :: Float)) * 100
-- =-=-= FIM 4ª QUESTÃO LETRA A PARTE 1 =-=-=

-- =-=-= 4ª QUESTÃO LETRA A PARTE 2 =-=-=
minuscula :: String -> String
minuscula [] = ""
minuscula (a:as) = (toLower a) : minuscula as

freqs :: String -> [Float]
freqs s = [(percent (snd (x,c)) (length s)) | x <- ['a'..'z'], let c = (length.filter (==x)) (minuscula s)]
-- =-=-= FIM 4ª QUESTÃO LETRA A PARTE 2 =-=-=

-- =-=-= 4ª QUESTÃO LETRA B =-=-=
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o - e)^2) / e|(o, e) <- zip os es]
-- =-=-= FIM 4ª QUESTÃO LETRA B =-=-=

-- =-=-= 4ª QUESTÃO LETRA C =-=-=
rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs
-- =-=-= FIM 4ª QUESTÃO LETRA C =-=-=

-- =-=-= 4ª QUESTÃO LETRA C PARTE 2 =-=-=
-- Frequencia das letras na lingua inglesa
freqRelEng :: [Float]
freqRelEng = [8.167, 1.492, 2.782, 4.253, 12.702, 2.228, 2.015, 6.094, 6.966, 0.153, 0.772, 4.025, 2.406, 6.749, 7.507, 1.929, 0.095, 5.987, 6.327, 9.056, 2.758, 0.978, 2.360, 0.150, 1.974, 0.074]

-- Frequencia das letras na lingua portuguesa
freqRelPor :: [Float]
freqRelPor = [14.63, 1.04,3.88,4.99,12.57,1.02,1.3,1.28,6.18,0.4,0.02,2.78,4.74,5.05,10.73,2.52,1.2,6.53,7.81,4.34,4.63,1.67,0.01,0.21,0.01,0.47]

-- Cria a frequencia de uma dada string
table' :: String -> [Float]
table' s = freqs s

-- Função auxiliar para criar uma tupla com os valores de uma lista e seu respectivo indice
createTupla :: [a] -> [(a, Int)]
createTupla lista = zip lista [0.. length lista]

-- Função que vai retornar o provavel fator de deslocamento
-- Recebe a string codificada e retorna o fator de deslocamento
-- Aqui eu uso a função auxiliar explicada logo acima para criar poder pegar qual indice
-- do menor elemento usando a função "minimum" para pegar qual o menor elemento da tupla
-- Como a string dada na questão estava em ingles, eu usei a tabela de frequencia em ingles
fator :: String -> Int 
fator s = snd (minimum(createTupla ([chisqr (rotate n (table' s)) freqRelEng | n <- [0..25]])))

-- =-=-= FIM 4ª QUESTÃO LETRA C PARTE 2 =-=-=

-- =-=-= 4ª QUESTÃO LETRA D =-=-=

crack :: String -> String       -- Professor, pra resolver essa questão corretamente
crack s = encode (-fator s) s   -- eu modifiquei levemente a função shift. 
                                -- Neste arquivo a função ignora os espaços em branco

-- =-=-= FIM 4ª QUESTÃO LETRA C PARTE 2 =-=-=