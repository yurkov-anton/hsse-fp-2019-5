% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
qsort(L,K):-
		L = [Head|Tail],
		partition(Head, Tail, List1, List2),
		qsort(List1, Sorted1),
		qsort(List2, Sorted2),
		append(Sorted1, [Head|Sorted2], K).

qsort([], []).

partition(Current, [Head|Tail], [Head|LowEq], High):-
		Current >= Head,
		partition(Current, Tail, LowEq, High).

partition(Current, [Head|Tail], LowEq, [Head|High]):-
		partition(Current, Tail, LowEq, High).

partition(_, [], [], []).

sort:-
	List = [-57, -99, 100, 17, 49, 62, 83, -67, 31, -87, -5, -94, -51, -11, 46, 39, -14, -74, -32, 77],
	qsort(List, Sorted),
	write(Sorted).



% Output
% ?- sort.
% [-99, -94, -87, -74, -67, -57, -51, -32, -14, -11, -5, 17, 31, 39, 46, 49, 62, 77, 83, 100]
% true 