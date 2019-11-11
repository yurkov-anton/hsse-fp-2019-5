% определить предикат merge(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

merge([], L2, L2).
merge(L1, [], L1).
merge([],[],[]).

merge([Head1|Tail1], [Head2|Tail2], [Head1|TailR]) :- 
	merge(Tail1, [Head2|Tail2], TailR), Head1 => Head2.
merge([Head1|Tail1], [Head2|Tail2], [Head2|TailR]) :- 
	merge([Head1|Tail1], Tail2, TailR), Head2 =< Head1.


/*
?- merge([1,2,5],[0,1,2],X).
X = [0, 1, 1, 2, 2, 5] .
*/

