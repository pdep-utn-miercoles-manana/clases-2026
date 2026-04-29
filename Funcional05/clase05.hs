factorial :: Int -> Int
factorial n 
  | n == 0 = 1
  | otherwise = n * factorial (n - 1)

factorial' :: Int -> Int
factorial' 0 = 1
factorial' n = n * factorial' (n - 1)

fibo 0 = 1
fibo 1 = 1
fibo n = fibo (n - 1) + fibo (n - 2)

-- Las listas son una estructura recursiva:
-- La lista con elementos es el caso recursivo
-- Y la lista vacía es el caso base
-- [1, 2, 3]
-- 1 : [2, 3]
-- 1 : 2 : [3]
-- 1 : 2 : 3 : []


-- La clase pasada vimos:
head (x:_) = x
tail (_:xs) = xs


-- Ahora definamos algunas otras funciones de listas:
length' [] = 0
length' (x:xs) = 1 + length' xs

reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

--Esta es la función ++, pero le pongo +++ para que no haya conflicto
(+++) [] lista2 = lista2
(+++) (x:xs) lista2 = x : xs +++ lista2

sum' [] = 0
sum' (x:xs) = x + sum' xs

product' [] = 1
product' (x:xs) = x * product' xs

and' [] = True
and' (x:xs) = x && and' xs

or' [] = False
or' (x:xs) = x || or' xs

concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

length'' lista = foldr (\x r -> 1 + r) 0 lista

map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' _ [] = []
filter' condicion (x:xs)
  | condicion x = x : filter' condicion xs
  | otherwise = filter' condicion xs


-- Si defino una función para plegar, puedo aprovechar para
-- reutilizar la lógica de las funciones anteriores, que
-- tienen una estructura muy similar:

sum'' lista = plegar (+) 0 lista
product'' lista = plegar (*) 1 lista
and'' lista = plegar (&&) True lista
or'' lista = plegar (||) False lista
concat'' lista = plegar (++) [] lista

plegar op vi [] = vi
plegar op vi (x:xs) = op x (plegar op vi xs)

foldr' :: (b -> a -> a) -> a -> [b] -> a
foldr' op vi [] = vi
foldr' op vi (x:xs) = op x (foldr op vi xs)


-- foldl :: (a -> b -> a) -> a -> [b] -> a