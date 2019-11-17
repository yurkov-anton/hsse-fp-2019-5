qsort(L,K):-q_sort(L,[],K).
q_sort([],Acc,Acc).
q_sort([H|T],Acc,Sorted):-
	change(H,T,L1,L2),
	q_sort(L1,Acc,Sorted1),q_sort(L2,[H|Sorted1],Sorted).
change(_,[],[],[]).
change(H,[X|T],[X|L],G) :- X=<H,change(H,T,L,G).
change(H,[X|T],L,[X|G]) :- X>H,change(H,T,L,G).
