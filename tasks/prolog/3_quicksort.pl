% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

/* window10 swi-prolog */
:- style_check(-singleton). /* warning */
/* reference bubble sort */

append([],Y,Y).
append([H|X],Y,[H|Z]):-append(X,Y,Z).

qqSort([],[]) :- !. 
qqSort([H],[H]) :- !. 
qqSort(L,SL) :- append(L1, [H1,H2|L2], L), H2 < H1, append(L1, [H2,H1|L2], NL), !, qqSort(NL,SL). 
qqSort(L,L). 

?- qqSort([4,6,1,3,2,8,12],K).
K = [1, 2, 3, 4, 6, 8, 12].

?- qqSort([12],K).
K = [12].

?- qqSort([3,7,1],K).
K = [1, 3, 7].

?- qqSort([12,11,2019],K).
K = [11, 12, 2019].
