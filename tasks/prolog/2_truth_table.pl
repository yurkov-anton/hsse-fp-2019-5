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
b(fail).

and(A,B) :- A,B.
or(A,B) :- A;B.
xor(A, B):- not(equ(A, B))
not(A) :- \+ A.
equ(A,B) :- A=B.

evaluate(M, true) :- M, !.
evaluate(_, fail).

truth_table(A,B,M) :-
  b(A),
  b(B),
  write(A),
  write('  '),
  write(B),
  write('  '),
  evaluate(M, N),
  writeln(N), fail.


?-truth_table(A,B,and(A,or(A,B))).
% true    true    true
% true    fail    true
% fail    true    fail
% fail    fail    fail
