% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями
% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями
% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% 5. используя в качестве исходных данных следующий граф отношений
	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5
% указать в каком порядке и какие ответы генерируются вашими методами
%	?- brother(X,Y).
%	?- cousin(X,Y).
%	?- grandson(X,Y).
%	?- descendent(X,Y).
		
brother(X,Y) :- dif(X,Y), father(F,X), father(F,Y).
cousin(X,Y) :- father(Fx,X), father(Fy,Y), brother(Fx,Fy).
grandson(X,Y) :- father(Fx,X), father(Y, Fx).
descendent(X,Y) :- father(Y,X); father(F,X), descendent(F,Y).

/*
forall(brother(X,Y), format('~w - ~w~n', [X,Y])).
b - c
c - b
d - e
e - d

forall(cousin(X,Y), format('~w - ~w~n', [X,Y])).
d - f
e - f
f - d
f - e

forall(grandson(X,Y), format('~w - ~w~n', [X,Y])).
d - a
e - a
f - a

forall(descendent(X,Y), format('~w - ~w~n', [X,Y])).
b - a
c - a
d - b
e - b
f - c
d - a
e - a
f - a
*/
