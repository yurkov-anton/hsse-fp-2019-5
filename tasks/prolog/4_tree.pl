% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% Quicksort
qsort([],[]).   

qsort([Elem|Tail], Sorted) :- split(Elem, Tail, Less, Greater),
                              qsort(Less, LessSorted),
                              qsort(Greater, GreaterSorted),
                              append(LessSorted, [Elem|GreaterSorted], Sorted).

split(_, [], [], []).
split(X, [Y|Tail], [Y|Less], Greater) :- X > Y, split(X, Tail, Less, Greater).
split(X, [Y|Tail], Less, [Y|Greater]) :- split(X, Tail, Less, Greater).
% ********************

/* make sorted list "balanced" */
balance(List, L, R) :-
    append(L, R, List),
    length(List, N),
    length(L, Ndiv2),
    Ndiv2 is N div 2.

balanced_tree_accum([], empty).
balanced_tree_accum(List, instant(Root, L, R)) :- 
	balance(List, Left, [Root|Right]),
    balanced_tree_accum(Left, L),
    balanced_tree_accum(Right, R).
    
balanced_tree(List, Tree) :- qsort(List, SortedList), balanced_tree_accum(SortedList, Tree).

    