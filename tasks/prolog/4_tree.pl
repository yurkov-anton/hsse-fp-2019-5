% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

split(Middle,[Head|Tail],[Head|L1],L2) :- 
    Head =< Middle, 
    split(Middle,Tail,L1,L2). 

split(Middle,[Head|Tail],L1,[Head|L2]) :- 
    Head > Middle,
    split(Middle,Tail,L1,L2).

split(_,[],[],[]).

quicksort([Head|Tail],R) :-
    split(Head,[Head|Tail],[H1|L1],L2),
    quicksort(L1,R1),
    quicksort(L2,R2),
    append(R1,[H1|R2],R).

quicksort([],[]).

div(L, A, B) :-
    append(A, B, L),
    length(L, N),
    Half is N div 2,
    length(A, Half).   

binary_tree(L, T) :-
    quicksort(L, SortL),
    build_binary_tree(SortL,T).

build_binary_tree(L, instant(Root, Left, Right)) :-
	div(L,L1,[Root|L2]),
    binary_tree(L1,Left),
    binary_tree(L2,Right).

build_binary_tree([], empty).

%?-binary_tree([1,6,7,3],T)
%T = instant(6, instant(3, instant(1, empty, empty), empty), instant(7, empty, empty))
    
