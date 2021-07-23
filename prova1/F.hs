listSize :: [a] -> Int -> Int 
listSize [] i = i 
listSize (a:as) i = listSize as (i+1)

zipAux :: [a] -> [b] -> [(a,b)]
zipAux (a:as) (b:bs) = (a,b) : zipAux as bs
zipAux _ _      = []

createTupla :: [a] -> [(a, Int)]
createTupla lista = zipAux lista [0.. listSize lista 0]

metade :: [a] -> ([a], [a])
metade lista = ([a | (a, b) <- createTupla lista, 
               (b `mod` 2) == 0], [a | (a, b) <- createTupla lista, (b `mod` 2) /= 0])