-- =-=-= Base para as questões D ~ H =-=-=
type Texto = String
type Id = String
type DataHoraPub = Int 

data Post = Post (Id, DataHoraPub) Texto deriving (Show, Eq, Read)
data Thread = Nil | T Post (Thread) deriving (Read)
-- =-=-= FIM =-=-=

-- =-=-= QUESTÃO D =-=-=
-- Função auxiliar que dado um post o transforma numa string
aux' :: Post -> String 
aux' (Post c d) = "(" ++ fst c ++ " " ++ (show (snd c)) ++ " " ++ d ++ ")" 

-- Fazendo com que Thread seja instância da classe Show
instance Show Thread where
    show Nil = "" 
    show (T a b) = aux' a ++ (show b) 

-- Implementando a função show' que transfoma uma Thread em uma String
show' :: Thread -> String
show' Nil = show Nil 
show' (T a b) = show (T a b)
-- =-=-= FIM QUESTÃO D =-=-=

-- =-=-= QUESTÃO E =-=-=
inserirPost :: Post -> Thread -> Thread
inserirPost a b = (T a b)
-- =-=-= FIM QUESTÃO E =-=-=