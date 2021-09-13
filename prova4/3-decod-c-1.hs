-- =-=-= 4ª QUESTÃO LETRA C PARTE 1 =-=-=
-- Função que rotaciona os elementos de uma lista
rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs
-- =-=-= FIM 4ª QUESTÃO LETRA C PARTE 1 =-=-=