merge :: Ord a => [a] -> [a] -> [a]
merge as [] = as
merge [] bs = bs
merge (a:as) (b:bs)
    | a < b     = a : merge as (b:bs)
    | otherwise = b : merge (a:as) bs