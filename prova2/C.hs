unzip' :: [(a, b)] -> ([a], [b])
unzip' lista = foldr f tupla lista
    where 
        tupla = ([], [])
        f (a, b) (as, bs) = (a:as, b:bs)