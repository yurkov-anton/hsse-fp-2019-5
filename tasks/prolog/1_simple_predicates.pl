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

:- writeln("Brothers: ").
brother(X,Y):- father(Z,X), father(Z,Y), X \= Y.
:- forall(brother(X,Y), (write(X), write(' and '), write(Y), writeln(" are brothers"))).
%% b and c are brothers
%% c and b are brothers
%% d and e are brothers
%% e and d are brothers

:- writeln("Cousins: ").
cousin(X,Y):- brother(Z,W), father(Z,X), father(W,Y), X \= Y.
:- forall(cousin(X,Y), (write(X), write(' and '), write(Y), writeln(" are cousins"))).
%% d and f are cousins
%% e and f are cousins
%% f and d are cousins
%% f and e are cousins

:- writeln("Grandsons: ").
grandson(X,Y):- father(Y,Z), father(Z,X).
:- forall(grandson(X,Y), (write(X), write(' is grandson for '), writeln(Y))).
%% d is grandson for a
%% e is grandson for a
%% f is grandson for a


:- writeln("Descendents: ").
descendent(X,Y):- father(Y,X).
descendent(X,Y):- father(Y,Z), descendent(X,Z).
:- forall(descendent(X,Y), (write(X), write(' is descendent for '), writeln(Y))).
%% b is descendent for a
%% c is descendent for a
%% d is descendent for b
%% e is descendent for b
%% f is descendent for c
%% d is descendent for a
%% e is descendent for a
%% f is descendent for a

