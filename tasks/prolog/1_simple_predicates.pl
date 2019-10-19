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

	brother(X,Y):- father(Z,X), father(Z,Y), X \= Y.
	cousin(X,Y):- brother(Z,W), father(Z,X), father(W,Y), X \= Y.
	grandson(X,Y):- father(Y,Z), father(Z,X).
	descendent(X,Y):- father(Y,X).
	descendent(X,Y):- father(Y,Z), descendent(X,Z).

:- writeln('List of brothers:').
:- forall(brother(X,Y), (write(X), write(' and '), writeln(Y))).

:- writeln('List of cousins:').
:- forall(cousin(X,Y), (write(X), write(' and '), writeln(Y))).

:- writeln('List of grandsons:').
:- forall(grandson(X,Y), (write(X), write(' is grandson '), writeln(Y))).

:- writeln('List descendents:').
:- forall(descendent(X,Y), (write(X), write(' is descendent '), writeln(Y))).

 
% List of brothers:
% b and c
% c and b
% d and e
% e and d
% List of cousins:
% d and f
% e and f
% f and d
% f and e
% List of grandsons:
% d is grandson a
% e is grandson a
% f is grandson a
% List descendents:
% b is descendent a
% c is descendent a
% d is descendent b
% e is descendent b
% f is descendent c
% d is descendent a
% e is descendent a
% f is descendent a