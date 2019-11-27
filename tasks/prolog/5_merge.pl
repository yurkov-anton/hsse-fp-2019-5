% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов
mrg(L1, L2, R):-
	L1 = [Head1|Tail1],
	L2 = [Head2|Tail2],
	merge([Head1|Tail1],[Head2|Tail2], R).

mrg(L1, [], L1).
mrg([], L2, L2).
mrg([],[],[]).

merge([Head1|Tail1], [Head2|Tail2], [Head1|Tail]):-
	Head1 < Head2, !,
	merge(Tail1, [Head2|Tail2], Tail).

merge([Head1|Tail1], [Head2|Tail2], [Head2|Tail]):-
	merge([Head1|Tail1], Tail2, Tail).

merge(L1, [], L1).
merge([], L2, L2).
merge([],[],[]).

merge:-
	List1 = [1,3,5],
	List2 = [2,4,6],
	List3 = [],
	write(List1), write(' merged with '), write(List2), nl,
	mrg(List1,List2,Result1),
	write(Result1), nl,
	write(List1), write(' merged with '), write(List3), nl,
	mrg(List1,[],Result2),
	write(Result2), nl,
	write(List3), write(' merged with '), write(List2), nl,
	mrg([],List2,Result3),
	write(Result3).


% Output
% [1, 3, 5] merged with [2, 4, 6]
% [1, 2, 3, 4, 5, 6]
% [1, 3, 5] merged with []
% [1, 3, 5]
% [] merged with [2, 4, 6]
% [2, 4, 6]
% true