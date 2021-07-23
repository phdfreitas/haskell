createTupla :: [a] -> [(a, Int)]
createTupla lista = zip lista [0.. length lista]

halve :: [a] -> ([a], [a])
halve lista = ([a | (a, b) <- createTupla lista, 
               (b `mod` 2) == 0], [a | (a, b) <- createTupla lista, (b `mod` 2) /= 0])

merge :: Ord a => [a] -> [a] -> [a]
merge as [] = as
merge [] bs = bs
merge (a:as) (b:bs)
    | a < b     = a : merge as (b:bs)
    | otherwise = b : merge (a:as) bs

msort :: Ord a => [a] -> [a]
msort []    = []
msort [a]   = [a]
msort as = merge (msort (fst (halve as))) (msort (snd (halve as)))