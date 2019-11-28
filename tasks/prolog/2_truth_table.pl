% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

boolean(true).
boolean(false).

and(A, B) :- A, B.
or(A, B) :- A; B.
xor(A, B) :- A \= B.
not(A) :- xor(true, A).
equ(A, B) :- A = B.

exec(X, true) :- X, !.
exec(Y, false).

truth_table(A, B, Expression) :- boolean(A), boolean(B), write(A), write('\s'), write(B), write('\s'), exec(Expression, X), writeln(X), false.