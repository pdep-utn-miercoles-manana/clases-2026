partido(argentina, argelia, 3, 0).
partido(argentina, austria, 2, 2).
partido(argentina, jordania, 3, 1).

partido(mexico, sudafrica, 2, 0).
partido(mexico, corea, 1, 0).
partido(mexico, chequia, 3, 0).

partido(uruguay, arabiaSaudita, 1, 1).
partido(uruguay, caboVerde, 2, 2).
partido(uruguay, espania, 0, 1).

resultado(Pais, OtroPais, perdio) :-
    partido(Pais, OtroPais, GolesPais, GolesOtroPais),
    GolesPais < GolesOtroPais.

resultado(Pais, OtroPais, gano) :-
    partido(Pais, OtroPais, GolesPais, GolesOtroPais),
    GolesPais > GolesOtroPais.

% gano/2
% gano(Pais, Otro).
gano(Pais, OtroPais) :-
  partido(Pais, OtroPais, GolesPais, GolesOtroPais),
  GolesPais > GolesOtroPais.

perdio(Pais, OtroPais) :- 
  partido(Pais, OtroPais, GolesPais, GolesOtroPais),
  GolesPais < GolesOtroPais.

empato(Pais, OtroPais) :-
  partido(Pais, OtroPais, Goles, Goles).

invicto(Pais) :-
  pais(Pais), % <-- generar el Pais
  not(perdio(Pais, _)).

% Predicado generador
pais(Pais) :-
  partido(Pais, _, _, _).

% ganoTodo/1
ganoTodo(Pais) :-
  pais(Pais),
  not(empato(Pais, _)),
  not(perdio(Pais, _)).

% fue ganador en todo si no hay partidos que no haya ganado
ganoTodo2(Pais) :-
  pais(Pais),
  not( (partido(Pais, OtroPais, _, _), not(gano(Pais, OtroPais))) ).

% forall/2
% Antecedente, Consecuente
ganoTodo3(Pais) :-
  pais(Pais), % <-- genero para evitar probl. de inversibilidad
  forall(partido(Pais, OtroPais, _, _), gano(Pais, OtroPais)).

% no recibió goles
vallaInvicta(Pais) :-
  pais(Pais),
  not(recibioGoles(Pais)).

recibioGoles(Pais) :-
  partido(Pais, _, _, GolesRecibidos),
  GolesRecibidos > 0.

% Cada país, cuál fue la vez que más goles metió
masGolesEnUnPartido(Pais, MuchosGoles) :-
  partido(Pais, _, MuchosGoles, _),
  forall(partido(Pais, _, Goles, _), MuchosGoles >= Goles).
  
% En todo el mundial, qué país metió más goles en un partido
masGolesEnUnPartido(Pais, MuchosGoles) :-
  partido(Pais, _, MuchosGoles, _),
  forall(partido(_, _, Goles, _), MuchosGoles >= Goles).
   