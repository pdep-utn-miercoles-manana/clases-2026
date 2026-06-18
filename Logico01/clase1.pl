% materia/2
% materia(NombreMateria, Anio).
materia(paradigmas, 2).
materia(fisica, 1).
materia(operativos, 2).
materia(desarrolloSW, 3).
materia(legislacion, 4).

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
  