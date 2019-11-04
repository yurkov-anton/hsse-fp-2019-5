% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([], []).
qsort([H | T], Sorted):-
    pivoting(H, T, L1, L2),
    qsort(L1, Sorted1),
    qsort(L2, Sorted2),
    append(Sorted1, [H | Sorted2], Sorted).

pivoting(H, [], [], []).
pivoting(H, [X | T], [X | L], G):- X =< H, pivoting(H, T, L, G).
pivoting(H, [X | T], L, [X | G]):- X > H, pivoting(H, T, L, G).

?- forall(qsort([10, -5, 0, 9, 11, 2, -7], Y), format('~w', [Y])).
% [-7,-5,0,2,9,10,11]
