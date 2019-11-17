% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


% Quick sort 

partition([], _Pivot, [], []):-!.
partition([Head|Tail], Pivot, [Head|Greater], Smaller):-
  Head >= Pivot, !, partition(Tail, Pivot, Greater, Smaller).
partition([Head|Tail], Pivot, Greater, [Head|Smaller]):-
  partition(Tail, Pivot, Greater, Smaller).

qsort([], []).
qsort([Pivot|Tail], SortedList):-
  partition(Tail, Pivot, Greater, Smaller),
  qsort(Greater, SortedGreater),
  qsort(Smaller, SortedSmaller),!,
  append(SortedSmaller, [Pivot|SortedGreater], SortedList).

% split function
split(List, Left, Right):-
    append(Left, Right, List),
    length(List, ListLength),
    Half is ListLength div 2,
    length(Left, Half).

% no nodes case
balanced_tree_impl([], empty).

% many nodes case
balanced_tree_impl(List, instant(Root, Left, Right)):-
    split(List, LeftList, [Root|RightList]),
    balanced_tree_impl(LeftList, Left),
    balanced_tree_impl(RightList, Right).

balanced_tree(L,T):-
	qsort(L,K),
	balanced_tree_impl(K,T).


/*
?- balanced_tree([3,9,1,8,2,7,6], T).
T = instant(6, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(8, instant(7, empty, empty), instant(9, empty, empty))) .

?- balanced_tree([],T).
T = empty .

*/