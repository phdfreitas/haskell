-- =-=-= 4ª QUESTÃO LETRA B =-=-=
-- Usando o método chi-quadrado para comparar duas listas
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o - e)^2) / e | (o, e) <- zip os es]
-- =-=-= FIM 4ª QUESTÃO LETRA B =-=-=