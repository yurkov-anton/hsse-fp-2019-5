% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
devide(_, [], [], []).
devide(Point, [Head|Tail], [Head|Left], Right) :-
    Point >= Head,
    devide(Point, Tail, Left, Right), !.
devide(Point, [Head|Tail], Left, [Head|Right]) :-
    devide(Point, Tail, Left, Right).

qsort([], []).
qsort([Head|Tail], Result) :-
    devide(Head, Tail, Left, Right),
    qsort(Left, LResult),
    qsort(Right, RResult),
    append(LResult, [Head|RResult], Result).



split(List, Left, Right):-
    append(Left, Right, List),
    length(List, Len),
    HalfLen is Len div 2,
    length(Left, HalfLen).

balanced_tree_help([], empty).

balanced_tree_help(List, instant(Root, LeftChild, RightChild)):-
    split(List, LeftList, [Root|RightList]),
    balanced_tree_help(LeftList, LeftChild),
    balanced_tree_help(RightList, RightChild).

balanced_tree(L,T):-
	qsort(L, SL),
	balanced_tree_help(SL,T).

%?-balanced_tree([2,9,7,5,4],S).
%S = instant(5, instant(4, instant(2, empty, empty), empty), instant(9, instant(7, empty, empty), empty))
