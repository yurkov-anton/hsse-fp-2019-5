and(A,B) :- A,B.
or(A,_) :- A.
or(_,B) :- B.
equ(A,B) :- or(and(A,B)), and(not(A),not(B)).
xor(A, B) :- not(equ(A,B)).

get_result(A,B,_):-
    write(A),
    write('\t'),
    write(B),
    write('\t').

get_result(_,_,Expr) :- Expr, !, write(true), nl.

get_result(_,_,_) :- write(fail), nl.


bind(true).
bind(fail).

truth_table(A,B,Expr) :-
    bind(A),
    bind(B),
    get_result(A,B,Expr),
    fail.

% ?- truth_table(A,B,and(A,or(A,B))).
% true 	 true 	 true
% true 	 fail 	 true
% fail 	 true 	 fail
% fail 	 fail 	 fail




