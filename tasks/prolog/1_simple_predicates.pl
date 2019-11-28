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
% 1. brother(X,Y)
	brother(B1,B2) :- father(F,B1), father(F,B2), B1\=B2.
% 2. cousin(X,Y)
	cousin(C1,C2) :- father(F1,C1), father(F2,C2), brother(F1,F2), C1\=C2.
% 3. grandson(X,Y)
	grandson(Gs,Gf) :- father(F,Gs), father(Gf,F), Gs\=Gf.
% 4. descendent(X,Y)
	descendent(D,A) :- father(A,D), D\=A.
        descendent(Dx,A) :- father(A,Dy), descendent(Dx,Dy), Dx\=A.

:- writeln('Generating results...').

:- writeln('Results of brothers:').
:- forall(brother(X,Y), (write(X), write(' and '), write(Y), writeln(' are brothers'))).

:- writeln('Results of cousins:').
:- forall(cousin(X,Y), (write(X), write(' and '), write(Y), writeln(' are cousins'))).

:- writeln('Results of grandsons:').
:- forall(grandson(X,Y), (write(X), write(' is grandson of '), writeln(Y))).

:- writeln('Results of descendents:').
:- forall(descendent(X,Y), (write(X), write(' is descendent of '), writeln(Y))).

:- writeln('The execution is finished.').

/*Generating results...
Results of brothers:
b and c are brothers
c and b are brothers
d and e are brothers
e and d are brothers
Results of cousins:
d and f are cousins
e and f are cousins
f and d are cousins
f and e are cousins
Results of grandsons:
d is grandson of a
e is grandson of a
f is grandson of a
Results of descendents:
b is descendent of a
c is descendent of a
d is descendent of b
e is descendent of b
f is descendent of c
d is descendent of a
e is descendent of a
f is descendent of a
The generation is finished.*/
