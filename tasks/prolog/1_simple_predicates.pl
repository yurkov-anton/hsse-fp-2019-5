father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).

% правила
brother(X,Y) :- father(Q,X), father(Q,Y), X \= Y.
cousin(X,Y) :- father(Q,X), father(W,Y), brother(Q,W).
grandson(X,Y) :- father(Y,W), father(W,X).
descendent(X,Y) :- father(Y,X).
descendent(X,Y) :- father(Y,W), descendent(X,W).

% вывод степеней родства
:- forall(brother(X,Y), (write(X),write(" is brother of "),write(Y),nl)).
:- forall(cousin(X,Y), (write(X),write(" is cousin of "),write(Y),nl)).
:- forall(grandson(X,Y), (write(X),write(" is grandson of "),write(Y),nl)).
:- forall(descendent(X,Y), (write(X),write(" is descedent of "),write(Y),nl)).