% materia/2
% materia(NombreMateria, Anio).
materia(paradigmas, 2).
materia(fisica, 1).
materia(operativos, 2).
materia(desarrolloSW, 3).
materia(legislacion, 4).
materia(analisis2, 2).
materia(analisis1,1).

% profesor/3
% profesor(Profe, Materia, Curso).
profesor(vinokur, fisica, z1004).
profesor(alf, paradigmas, k2024).
profesor(lucas, paradigmas, k2014).
profesor(esquivel, operativos, k2006).
profesor(alf, desarrolloSW, k2022).
profesor(fede, desarrolloSW, k3023).
profesor(fede, desarrolloSW, k3024).
profesor(corsini, legislacion, k4055).


% esFacil(Materia).
% si está después de 3ro
% o si es ingeniería y sociedad
% o si la da fede

esFacil(Materia) :-
  materia(Materia, Anio),
  Anio > 3.

esFacil(ingenieriaYSociedad).

esFacil(Materia) :-
  profesor(fede, Materia, _).


% correlativas(MateriaSegunda, MateriaPrimera).
correlativas(analisis2, analisis1).
correlativas(desarrolloSW, paradigmas).
correlativas(paradigmas, algoritmos).
correlativas(adr, desarrolloSW).

% sonCorrelativas(Materia1, Materia2).
% si se da una correlatividad directa o indirecta.
% (estudiar cómo hacer para que soporte N niveles).
sonCorrelativas(MateriaSegunda, MateriaPrimera) :-
  correlativas(MateriaSegunda, MateriaPrimera).

sonCorrelativas(Materia2, Materia1) :-
  correlativas(MateriaIntermedia, Materia1),
  correlativas(Materia2, MateriaIntermedia).


% expertoEnElTema/1: profe que da materias correlativas
expertoEnElTema(Profesor) :-
  profesor(Profesor, Materia2, _),
  profesor(Profesor, Materia1, _),
  sonCorrelativas(Materia1, Materia2).

%% masDeUnCursoDe/2:
%% algún profesor tenga más de un curso de una materia
masDeUnCursoDe(Profesor, Materia) :-
  profesor(Profesor, Materia, Curso2),
  profesor(Profesor, Materia, Curso1),
  Curso1 \= Curso2.
  

% Queremos saber qué profesores dan un solo curso
% para cada materia

daUnSoloCurso(Profesor) :-
  profesor(Profesor, _, _),
  not(masDeUnCursoDe(Profesor, _)).

% independientes/2 que relaciona
% dos materias que no son correlativas

independientes(UnaMateria, OtraMateria) :-
  materia(UnaMateria, _),
  materia(OtraMateria, _),
  not(sonCorrelativas(UnaMateria, OtraMateria)),
  UnaMateria \= OtraMateria.


% cursada(Alumno, Curso, NotaPrimerParcial, NotaSegundoParcial)
cursada(fede,k2103, 6,  6).
cursada(vicky,k1051,8, 10).

promedio(Alumno, Cursada, Promedio) :-
  cursada(Alumno, Cursada, Nota1, Nota2),
  Total is Nota1 + Nota2,
  Promedio is Total / 2.
% no se usa el is para asignacion, solo para cuentas
numeroFavorito(ale, Numero) :-
  Numero is 42.
numeroFavorito(ale, 42).

%% se cumple para un profesor que da una
% materia que no es fácil y
% no es experto en el tema
jodido(Profesor) :-
  profesor(Profesor, Materia, _),
  not((esFacil(Materia), expertoEnElTema(Profesor))).