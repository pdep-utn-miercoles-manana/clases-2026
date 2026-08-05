% pelicula(Nombre, Genero)
pelicula(viernes13, thriller).
pelicula(laLaLand, musical).
pelicula(backToTheFuture, cienciaFiccion).
pelicula(orgulloYPrejuicio, drama).
pelicula(dune, cienciaFiccion).
pelicula(starWars3, accion).
pelicula(terminator, accion).

% trabajaEn(Pelicula, Trabajador, Rol)
trabajaEn(starWars3, nataliePortman, actor(padme)).
trabajaEn(starWars3, ewanMcGregor, actor(obiWan)).
trabajaEn(terminator, arnoldSchwarzenegger, actor(terminator)).
trabajaEn(laLaLand, emmaStone, actor(mia)).
trabajaEn(laLaLand, ryanGosling, actor(ryanGosling)).
trabajaEn(orgulloYPrejuicio, keiraKnightley, actor(elizabeth)).
trabajaEn(backToTheFuture, michaelFox, actor(marty)).
trabajaEn(backToTheFuture, christopherLoyd, actor(docBrown)).
trabajaEn(dune, timothyChamame, actor(noViDuneTampoco)).
trabajaEn(viernes13, kevinBacon, actor(noMeAcuerdoChe)).
trabajaEn(starWars3, stevenSpielberg, productor(100)).
trabajaEn(starWars3, johnWilliams, compositor([laMarchaImperial, cantinaDeMosEisley])).
trabajaEn(laOdisea, christopherNolan, director).
trabajaEn(starWars3, georgeLucas, guionista(10000)).

% functores:
%   - son individuos **compuestos**
%   - tienen aridad como los predicados

% premio(Premio, Premiado)
premio(mejorActriz, nataliePortman).
premio(mejorActriz, emmaStone).
premio(mejorActorDeReparto, jacobElordi).
premio(mejorDirector, christopherNolan).
premio(mejorBandaSonora, indianaJonesIII).

% critica
% si es ryan gosling, suma 10 puntos
% si gano cualquier otro premio, suma 1 punto
% si gana premio a mejor actor, suma 5 puntos
% los directores, si tienen un premio
%   a mejor director, suman 2 puntos
% los compositores suman 0.25 puntos por
%   cada pieza
% los productores restan 0.01 por cada peso 
%   pelicula que hayan puesto
%   a menos que sea steven spielberg,
%   que suma 10 puntos
% los guionistas suman un punto por cada
%   1000 palabras del libreto

critica(Pelicula, Puntos) :-
    % findall(Individuo, Predicado, Lista)
    pelicula(Pelicula, _),
    findall(
        Trabajador,
        trabajaEn(Pelicula, Trabajador, _), 
        Trabajadores
    ),
    % map puntaje . trabajadores $ pelicula
    findall(
        Puntaje,
        (
            member(Trabajador, Trabajadores),
            puntaje(Trabajador, Pelicula, Puntaje)
        ),
        Puntajes
    ),
    sum_list(Puntajes, Puntos).


puntaje(Trabajador, Pelicula, Puntaje) :-
    trabajaEn(Pelicula, Trabajador, Rol),
    puntajePorRol(Rol, Puntaje, Trabajador).

% polimorfismo
puntajePorRol(actor(_), Puntaje, Actor) :-
    puntajeActor(Actor, Puntaje).

puntajePorRol(director, 2, Director) :-
    premio(mejorDirector, Director).

puntajePorRol(guionista(CantidadDePalabras), Puntaje, _) :-
    Puntaje is CantidadDePalabras / 1000.

puntajePorRol(productor(_), 10, stevenSpielberg).
puntajePorRol(productor(Plata), Puntaje, Productor) :-
    Productor \= stevenSpielberg,
    Puntaje is Plata * -0.01.

puntajePorRol(compositor(Canciones), Puntaje, _) :-
    length(Canciones, CantidadDeCanciones),
    Puntaje is 0.25 * CantidadDeCanciones.

puntajeActor(ryanGosling, 10).
puntajeActor(Actor, 5) :-
    ganoMejorActor(Actor).
puntajeActor(Actor, 1) :-
    not(ganoMejorActor(Actor)),
    premio(_, Actor).


ganoMejorActor(Alguien) :-
    premio(mejorActriz, Alguien).

ganoMejorActor(Alguien) :-
    premio(mejorActor, Alguien).


