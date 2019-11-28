% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
qsort([],[]).
qsort([H|T], Q) :- separate(H, T, Min, Maj), qsort(Min, M1), qsort(Maj, M2), append(M1,[H|M2],Q).

%separate(Pivot, List, Minor, Major)
separate(_,[],[],[]).
separate(X,[A|B],[A|Min],Maj) :- A =< X, separate(X, B, Min, Maj).
separate(X,[A|B],Min,[A|Maj]) :- A > X, separate(X, B, Min, Maj).

%qsort([123, -1, 0, 3, 8, 34, 89, -25, 65], K).
%K = [-25, -1, 0, 3, 8, 34, 65, 89, 123]
