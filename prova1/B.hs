numDiv :: Integral a => a -> a -> a 
numDiv a b
    | a /= 0 && a `mod` b == 0 = 1 + numDiv (a `div` b) b  
    | otherwise = 0
