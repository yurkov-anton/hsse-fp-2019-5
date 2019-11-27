$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

/* window10 swi-prolog */
:- style_check(-singleton). /* warning */

merge_sort(L, R):-split(L, L1, L2), merge_sort(L1, R1), merge_sort(L2, R2), merge(R1, R2, R).
merge_sort([H], [H]). 
merge_sort([], []).

split(L, L1, L2):-length(L, Len), Len>1, K is Len/2, splitK(L, K, L1, L2).

splitK([H|T], K, [H|L1], L2):- K>0, !, K1 is K-1, splitK(T, K1, L1, L2). splitK(T, _, [], T).

merge([H1|T1], [H2|T2], [H1|R]):-H1<H2, !, merge(T1, [H2|T2], R). 
merge([H1|T1], [H2|T2], [H2|R]):-merge([H1|T1], T2, R). 
merge([], L, L).
merge(L, [], L).

?- merge([11,13,2019],[4,6,7],R).
R = [4, 6, 7, 11, 13, 2019] .

?- merge([11,13,2019],[],R).
R = [11, 13, 2019].

?- merge([],[11,13,2019],R).
R = [11, 13, 2019] .
