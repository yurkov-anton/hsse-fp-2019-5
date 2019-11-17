% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([], []).
qsort([H | T], Sorted) :-
    pivoting(H, T, L1, L2),
    qsort(L1, Sorted1),
    qsort(L2, Sorted2),
    append(Sorted1, [H | Sorted2], Sorted).

pivoting(H, [], [], []).
pivoting(H, [X | T], [X | L], G) :- X =< H, pivoting(H, T, L, G).
pivoting(H, [X | T], L, [X | G]) :- X > H, pivoting(H, T, L, G).


split(List, Left, Right) :-
    append(Left, Right, List),
    length(List, Len),
    HalfLen is Len div 2,
    length(Left, HalfLen).

balanced_tree_help([], empty).
balanced_tree_help(List, instant(Root, LeftChild, RightChild)):-
    split(List, LeftList, [Root | RightList]),
    balanced_tree_help(LeftList, LeftChild),
    balanced_tree_help(RightList, RightChild).

balanced_tree(L, T) :-
    qsort(L, SL),
    balanced_tree_help(SL, T).

% ?- forall(balanced_tree([-5, 10, 0, 9, 11, 2, -7], Y), format('~w', [Y])).
% instant(2,instant(-5,instant(-7,empty,empty),instant(0,empty,empty)),instant(10,instant(9,empty,empty),instant(11,empty,empty)))
