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
	% ?- brother(X,Y).
	% ?- cousin(X,Y).
	% ?- grandson(X,Y).
	% ?- descendent(X,Y).

brother(X,Y) :- father(Z,Y), father(Z,X), X \= Y.

cousin(X,Y) :- father(Z,K), father(Z,L), father(K,X), father(L,Y), K \= L.

grandson(X,Y) :- father(Y,Z), father(Z,X).

descendent(X,Y) :- father(Y,X).
descendent(X,Y) :- father(Y,B), descendent(X,B).

?- format('brothers~n').
?- forall(brother(X,Y), format('~w - ~w~n', [X,Y])).

?- format('cousins~n').
?- forall(cousin(X,Y), format('~w - ~w~n', [X,Y])).

?- format('grandsons~n').
?- forall(grandson(X,Y), format('~w - ~w~n', [X,Y])).

?- format('descendents~n').
?- forall(descendent(X,Y), format('~w - ~w~n', [X,Y])).

/*
brothers
c - b
b - c
e - d
d - e
cousins
d - f
e - f
f - d
f - e
grandsons
d - a
e - a
f - a
descendents
b - a
c - a
d - b
e - b
f - c
d - a
e - a
f - a
*/
