import Text.Show.Functions

-- foldr1 es como fold, pero la semilla es el primer elemento de la lista
foldr1' f (x : xs) = foldr f x xs

-- tiene un bug! si n > m no converge y no termina
lista n m
    | n == m = [n]
    | otherwise = n : lista (n + 1) m

-- repeat :: a -> [a]
-- replicate :: Int -> a -> [a]
-- cycle :: [a] -> [a]
-- iterate :: (a -> a) -> [a] -> [a]

length' [] = 0
length' (_ : xs) = 1 + length' xs

doble x = x + x
-- doble (2 + 3)
-- (2 + 3) + (2 + 3)
-- 5 + 5 <- tenemos transparencia referencial, la reducción de ambas expresiones se puede hacer en el mismo paso
-- 10

-- Sos referencialmente transparente porque evaluas de forma diferida o evaluas de forma diferida porque tenes transparencia referencial?


-- Disfuncional --

tieneNombreLargo mascota =
    (length (fst mascota) > 9) == True
-- el == True está de más!
tieneNombreLargo' :: (String, a) -> Bool
tieneNombreLargo' =
    (> 9) . length . fst

poderDeEspada largoDeHoja
  | largoDeHoja > 20 = 100
  | largoDeHoja > 10 = 50


data Persona = Persona String Int Int String

sumarEnergia (Persona nombre energia edad apodo) =
    (Persona nombre (energia + 5) edad apodo)

triplicarLosPares numeros =
    (map (* 3) . filter even) numeros

esMamifero = const True

-- sonTodosMamiferos animales =
--    all (map esMamifero animales) animales
-- no tipa! map esMamifero animales es una lista de bools
-- all :: (a -> Bool) -> [a] -> [a]

-- and :: [Bool] -> Bool
sonTodosMamiferos' animales =
    (and . map esMamifero) animales
-- funciona, pero es poco declarativa

sonTodosMamiferos'' animales =
    all esMamifero animales

data Casa'
    = Casa' String Int [Casa' -> Casa']

data Casa = Casa {
    direccion :: String,
    temperatura :: Int,
    reguladores :: [Casa -> Casa]
}   deriving (Show)



abrirVentanas :: Casa -> Casa
prenderEstufa :: Casa -> Casa
prenderEstufa = undefined
encenderElAireA :: Int -> Casa -> Casa
encenderElAireA = undefined
mudarseA :: String -> Casa -> Casa
mudarseA = undefined
miCasaInteligente = Casa {
    direccion = "Medrano 951",
    temperatura = 26,
    reguladores = [
            abrirVentanas,
            prenderEstufa,
            mudarseA "calle falsa 123",
            encenderElAireA 24
        ]
   }


esBeatle "Ringo"  = True
esBeatle "John"   = True
esBeatle "George" = True
esBeatle "Paul"   = True
esBeatle _        = False

edad = undefined

sumaDeLasEdades [] = 0
sumaDeLasEdades (lista) =
   edad (head lista) + sumaDeLasEdades (drop 1 lista)

sumaDeLasEdades' [] = 0
sumaDeLasEdades' (e : es) =
   edad e + sumaDeLasEdades es

sumaDeLasEdades'' edades = sum . map edad

abrirVentanas casa =
  casa { direccion = direccion casa,
         temperatura = temperatura casa - 2,
         reguladores = reguladores casa }

abrirVentanas' (Casa direccion temperatura reguladores)
    = (Casa direccion (temperatura - 2) reguladores)

abrirVentanas'' casa =
  casa { temperatura = temperatura casa - 2 }

j r = (sum (map (*3) (filter even r))) < 100
-- poco expresivo!

esMenorA100LaSumaDelTripleDeLosPares numeros =
    (< 100) . sum . map (* 3) . filter even $ numeros

