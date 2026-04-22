
hidrogenoNombre = "Hidrógeno"
hidrogenoNumero = 1

oxigenoNombre = "Oxígeno"
oxigenoNumero = 8

nombresElementos = ["Hidrógeno", "Oxígeno", "Carbono"]
numerosElementos = [1, 8, 6]

-- structs??????

-- Data: estructura de dato

-- Int, String, Bool, Char, etc.

--                       N.A Nombre


-- Finalmente definimos que la sustancia es un data
-- que tiene *múltiples constructores*: puede construirse
-- como elemento o como compuesto.
-- Esto permite que una función como conduceBien, por nombrar una,
-- pueda funcionar tanto con elementos como con compuestos, ya que
-- espera algo del tipo Sustancia.
-- Si Elemento y Compuesto fueran tipos distintos, entonces la función
-- no podría trabajar con ambos a la vez.

-- Originalmente hicimos un data con un único constructor: en ese caso 
-- coincide en nombre con el del data.
data Sustancia
    = Elemento Int String String String
    | Compuesto String String [(Sustancia, Int)]
    deriving (Show, Eq)

hidrogeno = Elemento 1 "Hidrogeno" "H" "No metal"
oxigeno = Elemento 8 "Oxigeno" "O" "No metal"
oro = Elemento 79 "Oro" "Au" "Metal"
yodo = Elemento 53 "Yodo" "I" "Halogeno"

-- Un componente es un par formado por una sustancia y la
-- cantidad de moléculas de esa sustancia

--                         Nombre Grupo  Componentes

agua = Compuesto "Agua" "No metal" [(hidrogeno, 2), (oxigeno, 1)]
superAgua = Compuesto "Super Agua" "No metal" [(agua, 2), (yodo, 3)]

-- Tuplas!!!!

-- type alias / alias de tipo
type Estudiante = (String, Int, String)
type ElementoTupla = (String, Int, String)

estudiante :: Estudiante
estudiante = ("Miguel", 2208465, "Perez")

helio :: ElementoTupla
helio = ("Helio", 2, "He")

minMax :: (Num a, Ord a) => a -> a -> (a, a)
minMax numero1 numero2 = (min numero1 numero2, max numero1 numero2)

-- fst / snd

-- Pattern matching con variables anónimas
esVocal :: Char -> Bool
esVocal 'a'   = True
esVocal 'e'   = True
esVocal 'o'   = True
esVocal 'i'   = True
esVocal 'u'   = True
esVocal  _    = False

saludar :: String -> String
saludar "Ale"  = "Che Ale como estas"
saludar "Feli" = "Feli todo bien"
saludar  otro  = "Quien te conoce, " ++ otro ++ "?"
-- saludar otro2  = "Y a vos tampoco te conozco, " ++ otro2 -- nunca se ejecuta

numeroAtomico :: Sustancia -> Int
numeroAtomico (Elemento valorAtomico _ _ _) = valorAtomico

nombreSustancia :: Sustancia -> String
nombreSustancia (Elemento _ nombre _ _) = nombre
nombreSustancia (Compuesto nombre _ _)  = nombre


-- Guardas: son funciones partidas

signo x
    | x > 0 = 1
    | x < 0 = -1
    | x == 0 = 0

-- otherwise = True
modulo x
    | x >= 0    = x
    | otherwise = x * (-1)


-- Pattern matching con listas

-- Funciones análogas a head y tail:
cabezaLista (cabeza:cola) = cabeza
colaLista (cabeza:cola) = cola

-- Ambas funciones reciben una lista por parámetro, la cual se divide en cabeza y cola.
-- Lo sabemos porque las listas se construyen con la función cons (:)
-- Por ejemplo,
-- 1:[2, 3, 4] es equivalente a [1, 2, 3, 4].
-- True:[] es equivalente a [True].

-- Al usar un patrón (cabeza:cola), cuyas variables también suelen llamarse (x:xs),
-- estamos diciendo "esta función recibe una lista de al menos un elemento, y me interesa
-- tratar por separado a la cabeza y la cola".

-- Si no me interesara tratarlas por separado, lo puedo recibir como un parámetro cualquiera:
-- miFuncion lista = ...hago algo con la lista...

-- Esto puede extenderse a cualquier cantidad de elementos, no sólo cabeza y cola:
-- Si el patrón de lista fuera algo como (elemento1:elemento2:cola), entonces el pattern
-- matching funcionaría en ese caso para listas que reciban dos elementos, como podría ser
-- por ejemplo 1:2:[3, 4, 5], que es equivalente a [1, 2, 3, 4, 5], o 1:2:[], equivalente a [1, 2].

-- Finalmente, como en el primer caso la variable cola no se usa, y en el segundo la cabeza,
-- pueden reemplazarse por variables anónimas.

cabezaLista' (cabeza:_) = cabeza
colaLista' (_:cola) = cola
