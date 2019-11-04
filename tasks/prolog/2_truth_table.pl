/*% определить предикаты:
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
% fail fail fail*/

bool(true).
bool(fail).

and(A,B) :- A,B.
or(A,B) :- A;B.
xor(A,B) :- A\=B.
not(A) :- \+ A.
equ(A,B) :- A=B.

/* Expression judge */
eval(C,true) :- C, !.
eval(_,fail).

truth_table(A,B,C) :- 
	bool(A),
	bool(B),
	write(A),
	write('    '),
	write(B),
	write('    '),
	eval(C,D),
	writeln(D), (1=2).
	
%?- truth_table(A,B,and(A,or(A,B))).
%true    true    true
%true    fail    true
%fail    true    fail
%fail    fail    fail
