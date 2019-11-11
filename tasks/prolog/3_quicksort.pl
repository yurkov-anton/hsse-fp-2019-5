% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

split([], _Pivot, [], []):-!.
split([Head|Tail], Pivot, [Head|Greater], Smaller):-
  Head >= Pivot, !, split(Tail, Pivot, Greater, Smaller).
split([Head|Tail], Pivot, Greater, [Head|Smaller]):-
  split(Tail, Pivot, Greater, Smaller).

qsort([], []).
qsort([Pivot|Tail], SortedList):-
  split(Tail, Pivot, Greater, Smaller),
  qsort(Greater, SortedGreater),
  qsort(Smaller, SortedSmaller),!,
  append(SortedSmaller, [Pivot|SortedGreater], SortedList).

/*
?- qsort([1,5,9,4,6,0,3],X).
X = [0, 1, 3, 4, 5, 6, 9].
*/
