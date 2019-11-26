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

brother(X,Y):-father(Z,X),father(Z,Y),X\=Y.
cousin(X,Y):-father(A,X),father(B,Y),brother(A,B),X\=Y.
grandson(X,Y):-father(Y,A),father(A,X).
descendent(X,Y):-father(Y,X).
descendent(X,Y):-father(Y,A),descendent(X,A).

% указать в каком порядке и какие ответы генерируются вашими методами
	?- brother(X,Y).    % [(b,c),(c,b),(d,e),(e,d)]
	?- cousin(X,Y).     % [(d,f),(e,f),(f,e),(f,d)]
	?- grandson(X,Y).   % [(d,a),(e,a),(f,a)]
	?- descendent(X,Y). % [(b,a),(c,a),(d,b),(e,b),(f,c),(d,a),(e,a),(f,a)]
