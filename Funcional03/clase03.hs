-- palabraPar: me dice si la cantidad de letras de una palabra es par
palabraPar :: String -> Bool
-- palabraPar palabra = even (length palabra)
-- palabraPar palabra = (even . length) palabra
-- palabraPar palabra = even . length $ palabra
palabraPar            = even . length

-- multiploDe: me dice si un número es múltiplo de otro
multiploDe :: Int -> Int -> Bool
-- multiploDe numero1 numero2 = mod numero1 numero2 == 0
-- multiploDe numero1 numero2 = ((==0) . mod numero1) numero2
-- multiploDe numero1 numero2 = (==0) . mod numero1 $ numero2
multiploDe numero1            = (==0) . mod numero1

-- palabraQuintuplo: me dice si una palabra tiene una cantidad de letras múltiplo de 5
palabraQuintuplo :: String -> Bool
-- palabraQuintuplo palabra = flip multiploDe 5 (length palabra)
-- palabraQuintuplo palabra = (flip multiploDe 5 . length) palabra
-- palabraQuintuplo palabra = flip multiploDe 5 . length $ palabra
palabraQuintuplo            = flip multiploDe 5 . length


-- La mayoría de nuestras pruebas fueron en la consola;
-- vimos que hay listas de cualquier tipo (números, chars,
-- strings, booleanos, otras listas, funciones, etc)

-- Listas válidas:
-- [1, 2, 3, 4, 5]
-- "hola" (lista de caracteres)
-- ["uno", "dos", "tres"] (lista de lista de caracteres, o lista de strings)
-- [True, False, 3 > 4, even 5]
-- [even, odd]
-- [(+4), (*2)] (listas con funciones, siempre y cuando tengan el mismo tipo)

-- Funciones que tipamos y probamos sobre listas:
-- head
-- tail
-- init
-- last
-- !!
-- :
-- ++
-- reverse

-- Agregar el 6 al final de una lista de números:
-- [1, 2, 3, 4, 5] ++ [6]
-- o bien
-- reverse . (:6) . reverse $ [1, 2, 3, 4, 5]

-- Funciones que probamos sobre listas, pero de orden superior:
-- filter
-- map
-- any
-- all

-- Una función para valientes, con any:
-- any ($2) [even, odd]


-- Expresiones Lambda

sumaTres :: Integer -> Integer -> Integer -> Integer
sumaTres x y z = x + y + z

sumaTres' :: Integer -> Integer -> Integer -> Integer
sumaTres' = \x y z -> x + y + z

sumaTres'' :: Integer -> Integer -> Integer -> Integer
sumaTres'' =    \x    ->   \y    ->   \z    -> x + y + z