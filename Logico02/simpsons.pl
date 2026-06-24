padreDe(sven , abe).
padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).
madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge, maggie).
madreDe(selma, ling).

%tieneHijo/1: Nos dice si un personaje tiene un hijo o hija.
tieneHijo(Personaje):-
    padreDe(Personaje, _).

tieneHijo(Personaje):-
    madreDe(Personaje, _).

%hermanos/2: Relaciona a dos personajes cuando estos comparten madre y padre.
hermanos(Personaje1, Personaje2):-
    compartenMadre(Personaje1, Personaje2),
    compartenPadre(Personaje1, Personaje2).

compartenMadre(Personaje1, Personaje2):-
    madreDe(Madre, Personaje1),
    madreDe(Madre, Personaje2),
    Personaje1 \= Personaje2.

compartenPadre(Personaje1, Personaje2):-
    padreDe(Padre, Personaje1),
    padreDe(Padre, Personaje2),
    Personaje1 \= Personaje2. 

%medioHermanos/2: Relaciona a dos personajes cuando estos comparten madre o padre.
medioHermanos(Personaje1, Personaje2):-
    compartenMadre(Personaje1, Personaje2),
    not(compartenPadre(Personaje1, Personaje2)).

medioHermanos(Personaje1, Personaje2):-
    compartenPadre(Personaje1, Personaje2),
    not(compartenMadre(Personaje1, Personaje2)).


%tioDe/2: Relaciona a un personaje con su sobrino. 
tioDe(Tio, Sobrino):-
    hijoDe(Sobrino, Padre),
    hermanos(Padre, Tio).

hijoDe(Hijo, Padre):-
    padreDe(Padre, Hijo).

hijoDe(Hijo, Madre):-
    madreDe(Madre, Hijo).

%abueloMultiple/1: Nos dice si alguien es abuelo de al menos dos nietos.
abueloMultiple(Abuelo):-
    abueloDe(Abuelo, Nieto1),
    abueloDe(Abuelo, Nieto2),
    Nieto1 \= Nieto2.

abueloDe(Abuelo , Nieto):-
    hijoDe(Padre, Abuelo),
    hijoDe(Nieto, Padre).

%descendiente/2: Relaciona a dos personajes, en donde uno desciende del otro a través de una cantidad no predeterminada de generaciones. Por ejemplo, bart es descendiente de homero, de abe y también de sven simpson.
descendiente(Descendiente, Ancestro):-
    hijoDe(Descendiente, Ancestro).

descendiente(Descendiente, Ancestro):-
    hijoDe(Descendiente, Padre),
    descendiente(Padre, Ancestro).