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