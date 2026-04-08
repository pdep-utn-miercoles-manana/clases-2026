import Text.Show.Functions

anioActual :: Int
anioActual = 2026

estamosEnMarzo :: Bool
estamosEnMarzo = False

estamosEnAbril :: Bool
estamosEnAbril = True

letraA :: Char
letraA = 'a'

saludo :: String
saludo = "Hola mundo"

numeroE :: Float
numeroE = 2.71828

siguiente :: Int -> Int 
siguiente numero = numero + 1

doble :: Num a => a -> a
doble numero = numero * 2
doble' numero = numero + numero
doble'' numero = (+ numero) numero

esPar :: Int -> Bool
esPar numero = even numero

identidad :: a -> a
identidad algo = id algo

multiplicar :: Float -> Float -> Float
multiplicar unNumero otroNumero =
    unNumero * otroNumero

siguienteDelSiguiente :: Int -> Int
siguienteDelSiguiente unNumero =
    siguiente (siguiente unNumero)

siguienteDelSiguiente' :: Int -> Int
siguienteDelSiguiente' unNumero =
    (siguiente . siguiente) unNumero

dobleDelSiguienteDelSiguiente :: Int -> Int
dobleDelSiguienteDelSiguiente unNumero =
    (doble . siguiente . siguiente) unNumero

sumar2   = (+) dos
sumar2'  = (2 +)
sumar2'' = (+ 2)
sumar2''' x = (+ 2) x
-- sumar2'''' = 2 +

dividirPor2 = (/ 2)
dosDivididoPor = (2 /)

dos :: Int
dos = 2

-- siguienteDelSiguiente'' unNumero =
    -- (siguiente . siguiente) unNumero

siguienteDelSiguiente'' unNumero =
    siguiente . siguiente $ unNumero

siguienteDelSiguiente''' unNumero =
    ($) (siguiente . siguiente) unNumero

siguienteDelSiguiente'''' unNumero =
    ($) siguienteDelSiguiente'' unNumero

siguienteDelSiguiente5 = siguiente . siguiente

darVuelta funcion a b = funcion b a
-- flip :: (a -> b -> c) -> b -> a -> c

aplicar f a = f a
aplicar' f  = f
aplicar''   = ($)

reaplicar f a = (f . f) a
reaplicar' f a = f (f a)
reaplicar'' f a = f $ f a
reaplicar''' f a = ((.) f f) a

x y z t w = (w y . z) t + y
x' y z t w = w y . z
