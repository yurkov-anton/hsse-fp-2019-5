% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 


partition([H|T], Y, [H | Le], Gt) :- H =< Y,
	partition(T, Y, Le, Gt).

partition([H|T], Y, Le, [H | Gt]) :-
	partition(T, Y, Le, Gt).

partition([], Y, [], []).

qsort([],[]).

qsort([H|T], Result) :-
	partition(T, H, Left, Right),
	qsort(Left, LeftRes),
	qsort(Right, RightRes),
	append(LeftRes, [H | RightRes], Result).


qsort(L, K) :- qsort(L, K).




