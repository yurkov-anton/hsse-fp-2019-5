% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort(L,K):-i_sort(L,[],K).
i_sort([],Ac,Ac).
i_sort([H|T],Ac,R):-insert(H,Ac,Ac1),i_sort(T,Ac1,R).
   
insert(X,[Y|T],[Y|T1]):-X>Y,insert(X,T,T1).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).

balanced_tree([],T) :- write('empty').
balanced_tree(L,T) :- inl(L,empty,T).

inl([N|Ns], T0, T) :-
    ins(N, T0, T1),
    inl(Ns, T1, T).
inl([], T, T).

ins(I, empty, t(I, empty, empty)).
ins(I, t(X, L, R), t(Y, P, Q)) :-
    (   I < X
    ->  ins(I, L, U),
        (P, Y, Q) = (U, X, R)
    ;   I > X
    ->  ins(I, R, U),
        (P, Y, Q) = (L, X, U)
    ;   (P, Y, Q) = (L, X, R)  
    ).