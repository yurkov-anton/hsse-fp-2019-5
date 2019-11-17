% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
:-style_check(-singleton).

pivot(_, [], [], []).

pivot(Pivot, [H|T], [H|LTE], GT) :- 
	Pivot >= H, 
	pivot(Pivot, T, LTE, GT). 

pivot(Pivot, [H|T], LTE, [H|GT]) :- 
	pivot(Pivot, T, LTE, GT).

qsort([], []).

qsort([H|T], R) :- 
	pivot(H, T, L1, L2), 
	qsort(L1, SL1), 
	qsort(L2, SL2),
	append(SL1, [H|SL2], R).

split(List, Left, Right):-
    append(Left, Right, List),
    length(List, ListLength),
    Half is ListLength div 2,
    length(Left, Half).

balanced_tree_impl([], empty).

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