% The function of dividing the list into 2 parts, in the first part are
% elements are greater than the specified value, in the second less than
% the specified value.
divide([], _Pivot, [], []):-!.
divide([Head|Tail], Pivot, [Head|GreaterList], SmallerList):-
  Head >= Pivot, !, divide(Tail, Pivot, GreaterList, SmallerList).
divide([Head|Tail], Pivot, GreaterList, [Head|SmallerList]):-
  divide(Tail, Pivot, GreaterList, SmallerList).

qsort([], []).
qsort([Elem], [Elem]).
qsort([Pivot|Tail], SortedList):-
  divide(Tail, Pivot, GreaterList, SmallerList),
  qsort(GreaterList, SortedGreaterList),
  qsort(SmallerList, SortedSmallerList),!,
  append(SortedSmallerList, [Pivot|SortedGreaterList], SortedList).

% ?- qsort([3, 4, 2, 6, 5, 9], X).
% X = [2, 3, 4, 5, 6, 9]
%
% ?- qsort([3], X).
% X = [3]
%
% ?- qsort([], X).
% X = []
