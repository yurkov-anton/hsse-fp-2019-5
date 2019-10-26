% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

apnd( [], X, X).                                   
apnd( [X | Y], Z, [X | W]) :- apnd( Y, Z, W).

qsort([],[]).
qsort([H|T],R):-
	pivoting(H,T,L1,L2),qsort(L1,R1),qsort(L2,R2),
	apnd(R1,[H|R2], R).
   
pivoting(H,[],[],[]).
pivoting(H,[X|T],[X|L],G):-X=<H,pivoting(H,T,L,G).
pivoting(H,[X|T],L,[X|G]):-X>H,pivoting(H,T,L,G).

%| ?- qsort( [1,2,3,3,2,1,1,2,3],C).

%C = [1,1,1,2,2,2,3,3,3] ? ;