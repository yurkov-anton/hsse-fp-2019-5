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

split_list(List, Left, Right):-
    append(Left, Right, List),
    length(List, Length),
    Path is Length div 2,
    length(Left, Path).

balanced_tree_implementation([], empty).

balanced_tree_implementation(List, instant(Root, Left, Right)):-
    split_list(List, LeftList, [Root|RightList]),
    balanced_tree_implementation(LeftList, Left),
    balanced_tree_implementation(RightList, Right).

balanced_tree(L,T):-
	qsort(L,K),
	balanced_tree_implementation(K,T).

% ?- balanced_tree([3,4,2,6,5,9,8], T).
% T = instant(5, instant(3, instant(2, empty, empty), instant(4, % empty, empty)), instant(8, instant(6, empty, empty), instant(9, % empty, empty))) .

% ?- balanced_tree([], T).
% T = empty
