% 1
todosSiguenA(Rey) :-
  personaje(Rey),
  forall(personaje(Personaje), sigueA(Personaje, Rey)).

% 2

ciudadInteresante(Ciudad) :-
  antigua(Ciudad),
  alMenosDiezLugaresCopados(Ciudad).

alMenosDiezLugaresCopados(Ciudad) :-
  findall(LugarCopado,
          lugarCopadoDe(LugarCopado, Ciudad),
          LugaresCopados),
  length(LugareCopados, Cantidad),
  Cantidad > 10.

lugarCopadoDe(Lugar, Ciudad) :-
  puntoDeInteres(Lugar, Ciudad),
  copado(Lugar).
%          |---> bar(CantVarCer)
%          |---> museo(Tipo)
%          |---> estadio(Cap)

copado(bar(CantidadVariedadesCerveza)) :-
  CantidadVariedadesCerveza > 4.
copado(museo(cienciasNaturales)).
copado(estadio(Capacidad)) :- 
  Capacidad > 40000.

% 3
inFraganti(Delito, Delincuente) :-
  cometio(Delito, Delincuente),
  testigo(Delito, Testigo).

% 4
viejoMaestro(Pensador) :-
  pensamiento(Pensador, _),
  forall(pensamiento(Pensador, Pensamiento),
         llegaANuestrosDias(Pensamiento)).

% 5
numeroDeLaSuerte(Persona, Numero) :-
  diaDelNacimiento(Persona, Numero).

numeroDeLaSuerte(joaquin, 2).

% 6
obraMaestra(Compositor, Obra) :-
  compositor(Compositor, Obra),
  forall(movimiento(Obra, Movimiento),
         movimientoMaestro(Movimiento)).

% 7
puedeComer(analia, Comida) :-
  ingrediente(Comida, _),
  forall(ingrediente(Comida, Ingrediente),
     		(esVegano(Ingrediente)).

% en clase hicimos un O, pero es un Y! No nos dimos cuenta.
% (Creo que alguien me lo quiso decir pero no le entendí :))
% Tiene que no tener leche, no tener carne, Y no tener huevo para ser vegano.
% Caso contrario, si es un O, pasa por vegano si le falta UN ingrediente,
% a pesar de que tenga alguno de los otros.

esVegano(Ingrediente) :-
  not(contieneLeche(Ingrediente)),
  not(contieneCarne(Ingrediente)),
  not(contieneHuevo(Ingrediente)).

% Punto 8
% Hay que eliminar la lógica repetida
% de itemPaquete(Paquete, ...) que está tres veces.