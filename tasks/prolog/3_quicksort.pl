% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

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

%?-quicksort([4,2,3,1],A)
%A = [1, 2, 3, 4]
%?-quicksort([],A)
%A = []
%?-quicksort([1],A)
%A = [1]
