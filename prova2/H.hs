-- =-=-=-= Base para as questões D ~ H =-=-=-=
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
    
-- =-=-= QUESTÃO F =-=-=
threadToList :: Thread -> [Post]
threadToList Nil = []
threadToList (T a Nil)  = a : []
threadToList (T a b)    = a : [] ++ threadToList b
-- =-=-= FIM QUESTÃO F =-=-=

-- =-=-= QUESTÃO G =-=-=    
listToThread :: [Post] -> Thread
listToThread [] = Nil
listToThread (x:xs) = (inserirPost x (listToThread xs))
-- =-=-= FIM QUESTÃO G =-=-=

-- =-=-= QUESTÃO H =-=-= 
aux'' :: Post -> (Id, DataHoraPub) -- Função que "retorna" apenas o id e data do post
aux'' (Post c d) = (fst c, snd c) 

-- Função que procura o (Id, DataHoraPub) dado, numa lista de posts
-- e devolve a lista de posts sem o id encontrado
removerPostAux :: (Id, DataHoraPub) -> [Post] -> [Post]
removerPostAux _ [] = []
removerPostAux p (a:as)
    | p == (aux'' a) = removerPostAux p as 
    | otherwise = [a] ++ (removerPostAux p as)

-- Função que recebe um (Id, Data) de um post e uma Thread
-- e devolve a Thread sem o post que tem o (Id, Data) dado
removerPost :: (Id, DataHoraPub) -> Thread -> Thread
removerPost p t = listToThread (removerPostAux p (threadToList t))
-- =-=-= FIM QUESTÃO H =-=-=