% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 


partition([H|T], Y, [H | Le], Gt) :- H =< Y,
	partition(T, Y, Le, Gt).

partition([H|T], Y, Le, [H | Gt]) :-
	partition(T, Y, Le, Gt).

partition([], Y, [], []).

qsort(L, K) :- quicksort(L, K), !.

quicksort([],[]).

quicksort([H|T], Result) :-
	partition(T, H, Left, Right),
	quicksort(Left, LeftRes),
	quicksort(Right, RightRes),
	append(LeftRes, [H | RightRes], Result).
