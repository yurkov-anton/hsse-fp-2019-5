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

and(A,B) :- A, B.

or(A,B) :- A -> true; B.

not(A) :- A \= true.

xor(A,B) :- or(A,B), not(and(A,B)).

equ(A,B) :- A = B.

bool(true).
bool(fail).


truth_table(A,B,Expr) :- bool(A), bool(B), do(A,B,Expr), fail.
do(A,B,_) :- write(A), write('\t'), write(B), write('\t'), fail.
do(_,_,Expr) :- Expr, !, write(true), nl.
do(_,_,_) :- write(fail), nl.

% ?- truth_table(A,B,and(A,or(B,B))).
% true    true    true
% true    fail    fail
% fail    true    fail
% fail    fail    fail
% false.
