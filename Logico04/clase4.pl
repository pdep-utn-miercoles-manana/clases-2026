partido(argentina, argelia, 3, 0).
partido(argentina, austria, 2, 0).
partido(argentina, jordania, 3, 1).

partido(mexico, sudafrica, 2, 0).
partido(mexico, corea, 1, 0).
partido(mexico, chequia, 3, 0).

partido(uruguay, arabiaSaudita, 1, 1).
partido(uruguay, caboVerde, 2, 2).
partido(uruguay, espania, 0, 1).

partido(belgica, egipto, 1, 1).

gano(Pais, OtroPais) :-
  partido(Pais, OtroPais, GolesPais, GolesOtroPais),
  GolesPais > GolesOtroPais.

empato(Pais, OtroPais) :-
  partido(Pais, OtroPais, Goles, Goles).


% Listas:

% [1, 2, 3, 4, 5]
% [argentina, austria, jordania, argelia]
% [argentina78, 4, austria, marcador]

% Cabeza|Cola

% 5|2|1|[]
% [5, 2, 1]


% queremos saber si un país completó su grupo,
% se cumple cuando jugó todos los partidos (al menos 3).

% encontrar cuáles cumplen algo
% findall/3
% findall(VariableDeInteres, Consulta, Lista).

completoGrupo(Pais) :-
  partido(Pais, _, _, _),
  findall(Rival, partido(Pais, Rival, _, _), Rivales),
  length(Rivales, Cuantos),
  Cuantos >= 3.

% Una forma de hacerlo mucho menos cómoda
% completoGrupo(Pais) :-
%   partido(Pais, Rival1, _, _),
%   partido(Pais, Rival2, _, _),
%   Rival1 \= Rival2,
%   partido(Pais, Rival3, _, _),
%   Rival3 \= Rival1,
%   Rival3 \= Rival2.

% cuántos goles metió un país?
cuantosGolesMetio(Pais, CuantosGoles) :-
  partido(Pais, _, _, _),
  findall(Goles, partido(Pais, _, Goles, _), ListaGoles),
  sumlist(ListaGoles, CuantosGoles).

% cuántos puntos sumó un país en sus partidos?
puntosTotales(Pais, PuntosTotales) :-
  partido(Pais, _, _, _),
  puntosPorGanar(Pais, PuntosPorGanar),
  puntosPorEmpatar(Pais, PuntosPorEmpatar),
  PuntosTotales is PuntosPorGanar + PuntosPorEmpatar.

puntosPorGanar(Pais, Puntos) :-
  findall(Rival, gano(Pais, Rival), Lista),
  length(Lista, Cantidad),
  Puntos is Cantidad * 3.

puntosPorEmpatar(Pais, Puntos) :-
  findall(Rival, empato(Pais, Rival), Lista),
  length(Lista, Puntos).
