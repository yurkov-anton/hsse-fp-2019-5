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
brother(Person1, Person2):-
	father(Dad, Person1),
	father(Dad, Person2),
	not(Person1 = Person2).

cousin(Person1, Person2):-
	father(Dad1, Person1),
	father(Dad2, Person2),
	not(Person1 = Person2),
	brother(Dad1, Dad2).

grandson(Grandson, Grandfather):-
	father(Grandfather, Son),
	father(Son, Grandson).

descent(Descendent, Predecessor):-
	father(Predecessor, Node),
	descent(Descendent, Node).

descent(Descendent, Predecessor):-
	father(Predecessor, Descendent).


test:-
	writeln('Brothers:'),
	forall(brother(Person1, Person2), (write(Person1), write(' and '), write(Person2), nl)),
	writeln('Cousins:'),
	forall(cousin(Person1, Person2), (write(Person1), write(' and '), write(Person2), nl)),
	writeln('Grandsons:'),
	forall(grandson(Person1, Person2), (write(Person1), write(' and '), write(Person2), nl)),
	writeln('Descendents:'),
	forall(descent(Person1, Person2), (write(Person1), write(' and '), write(Person2), nl)).
	
% Output:
% Brothers:
% b and c
% c and b
% d and e
% e and d
% Cousins:
% d and f
% e and f
% f and d
% f and e
% Grandsons:
% d and a
% e and a
% f and a
% Descendents:
% d and a
% e and a
% f and a
% b and a
% c and a
% d and b
% e and b
% f and c
% true