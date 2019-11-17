and(A,B) :- A,B.
or(A,B) :- A;B.
xor(A,B) :- A\=B.
not(A) :- \+A.
equ(A,B) :- A=B.


evaluate(Expression, true) :- Expression, !.
evaluate(_, fail).

bool(true).
bool(fail).


truth_table(A,B,Expression) :-
	bool(A),
	bool(B),
	write(A),
	write(' \t '),
	write(B),
	write(' \t '),
	evaluate(Expression, Result),
	write(Result),nl,fail.
% truth_table(A,B, expression) :
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail
