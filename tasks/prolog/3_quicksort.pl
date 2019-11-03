% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort([H|T], Sorted):-
	pivoting(H, T, L1, L2), qsort(L1, Sorted1), qsort(L2, Sorted2), append(Sorted1, [H|Sorted2], Sorted).
   
pivoting(H, [], [], []).
pivoting(H, [X|T], [X|L], G):- X =< H, pivoting(H, T, L, G).
pivoting(H, [X|T], L, [X|G]):- X > H, pivoting(H, T, L, G).

% ?- qsort([4,3,5,1,2], Y).
% Y = [1, 2, 3, 4, 5] ;
% false.