father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).

brother(X,Y) :- father(Z,X), father(Z,Y), X\=Y.
cousin(X,Y) :- father(S,X), father(W,Y), S\=W, brother(S, W).
grandson(X,Y) :- father(Q,X), father(Y,Q).
descendent(X,Y) :- (father(Y,X); father(Q,X), father(Y,Q)).

% ?- setof([X,Y],brother(X,Y),RESULT).
% RESULT = [[b, c], [c, b], [d, e], [e, d]]
%
%
% ?- setof([X,Y],cousin(X,Y),RESULT).
% RESULT = [[d, f], [e, f], [f, d], [f, e]]
%
%
% ?- setof([X,Y],grandson(X,Y),RESULT).
% RESULT = [[d, a], [e, a], [f, a]]
%
%
% ?- setof([X,Y],descendent(X,Y),RESULT).
% RESULT = [[b, a], [c, a], [d, a], [d, b], [e, a], [e, b], [f, a]]

