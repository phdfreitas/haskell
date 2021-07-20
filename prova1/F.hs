createTupla :: [a] -> [(a, Int)]
createTupla lista = zip lista [0.. length lista]

metade :: [a] -> ([a], [a])
metade lista = ([a | (a, b) <- createTupla lista, 
               (b `mod` 2) == 0], [a | (a, b) <- createTupla lista, (b `mod` 2) /= 0])