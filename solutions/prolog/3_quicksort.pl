% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort(L,K):-i_sort(L,[],K).
i_sort([],Ac,Ac).
i_sort([H|T],Ac,R):-insert(H,Ac,Ac1),i_sort(T,Ac1,R).
   
insert(X,[Y|T],[Y|T1]):-X>Y,insert(X,T,T1).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).