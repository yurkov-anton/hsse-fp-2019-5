% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

/* window10 swi-prolog */
:- style_check(-singleton). /* warning */
/* reference bubble sort */

append([],Y,Y).
append([H|X],Y,[H|Z]):-append(X,Y,Z).

qqSort([],[]) :- !.
qqSort([H],[H]) :- !.
qqSort(L,SL) :- append(L1, [H1,H2|L2], L), H2 < H1, append(L1, [H2,H1|L2], NL), !,qqSort(NL,SL).
qqSort(L,L).

split(List, Left, Right):-append(Left, Right, List),length(List, Length), Len  is Length div 2, length(Left, Len).

instant(Root,LeftChild,RightChild):- t(Root,t(LeftChild,empty,empty),t(RightChild,empty,empty)).

balanced_tree_aux([], empty).
balanced_tree_aux(List, instant(Root, LeftChild, RightChild)):-split(List, LeftList, [Root|RightList]),balanced_tree_aux(LeftList, LeftChild),balanced_tree_aux(RightList, RightChild).

balanced_tree(L,T):-qqSort(L, SL),balanced_tree_aux(SL,T).

?- balanced_tree([11,12,20,19], T).
T = instant(19, instant(12, instant(11, empty, empty), empty), instant(20, empty, empty)) ;
false.
