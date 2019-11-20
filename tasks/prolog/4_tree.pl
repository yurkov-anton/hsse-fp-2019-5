% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

/* List add */
append([],R,R).
append([H|T],Z,[H|S]) :- append(T,Z,S).

/* Segmentation list */
partition(_,[],[],[]).
partition(P,[H|T],[H|S],B) :- H=<P,partition(P,T,S,B).
partition(P,[H|T],S,[H|B]) :- H>P,partition(P,T,S,B).

/* Sort recursive */
qsort([],[]).
qsort([H|T],R) :-
	partition(H,T,S,B),
	qsort(S,SS),
	qsort(B,BS),
	append(SS,[H|BS],R).

/*list length*/
len([],0).
len([_|T],N) :-
	len(T,X),
	N is X+1.

/*split list*/
split_list(List,Left,Right) :-
	append(Left,Right,List),
	len(List,Llen),
	Half is Llen div 2,
	len(Left,Half).

/*create balanced tree*/
create_balanced_tree([],empty).
create_balanced_tree(List,instant(H,L,R)) :-
	split_list(List,LTemp,[H|RTemp]),
	create_balanced_tree(LTemp,L),
	create_balanced_tree(RTemp,R).

/*sort list and create balanced tree*/
balanced_tree(L,T) :-
	qsort(L,K),
	create_balanced_tree(K,T).

%?- balanced_tree([6,12,78,2,46],T).
%T = instant(12, instant(6, instant(2, empty, empty), empty), instant(78, instant(46, empty, empty), empty)) ;
