father(a,b).  % 1                 
father(a,c).  % 2
father(b,d).  % 3
father(b,e).  % 4
father(c,f).  % 5

brother(X, Y) :- father(Z, Y), father(Z, X), not(X == Y).

cousin(X, Y) :- father(A, Y), brother(B, A), father(B, X).

grandson(X, Y) :- father(Y, A), father(A, X).

descendent(X, Y) :- father(Y, X).
descendent(X, Y) :- father(Y, Z), descendent(Z, Y).

% указать в каком порядке и какие ответы генерируются вашими методами

%	?- brother(X,Y).
%   X = c, Y = b

%	?- cousin(X,Y).
%   X = f, Y = d

%	?- grandson(X,Y).
%   X = d, Y = a

%	?- descendent(X,Y).
%   X = b, Y = a