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

b(true).
b(false).

not(X) :- X, !, false.
not(_).

equ(A, B) :- A = B.
and(A,B)  :- A,B.
or(A,B)   :- A;B.
xor(A,B)  :- A\=B.

calc(X, true) :- X, !.
calc(_, false).

truth_table(X,Y,Z) :-
  b(X),
  b(Y),
  write(X),
  write('  '),
  write(Y),
  write('  '),
  calc(Z, R),
  writeln(R), false.


?-truth_table(A,B,and(A,or(A,B))).

%true   true   true
%true   false  true
%false  true   false
%false  false  false