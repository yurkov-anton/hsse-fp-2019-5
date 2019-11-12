and(A,B):- A,B.
or(A,B):- A; B.
not(A):- \+A.
equ(A,B):- A = B.
xor(A,B):- not(equ(A, B)).

bool(true).
bool(false).

evaluate(E,true) :- E.
evaluate(E,false) :- not(E).

print_table(X,Y,R) :- write(X), write("\t"), write(Y), write("\t"), write(R),nl.
truth_table(A, B, E) :- forall((bool(A), bool(B)), (write(A), write("\t"), write(B), write("\t"), evaluate(E, R), write(R),nl)).

:- print_table('A','B','OR').
:- truth_table(A,B,or(A,B)).

:- print_table('A','B','AND&OR').
:- truth_table(A,B,and(A,or(A,B))).

:- print_table('A','B','XOR').
:- truth_table(A,B,xor(A,B)).