% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2
% определяет список R, составленный из этих элементов

mrg([], List, List).
mrg(List, [], List).
mrg([], [], []).
mrg([Head1 | Tail1], [Head2 | Tail2], [Head1 | TailRes]) :-
    Head1 < Head2,
    mrg(Tail1, [Head2 | Tail2], TailRes),
    !.

mrg([Head1 | Tail1], [Head2 | Tail2], [Head2 | TailRes]) :-
    mrg([Head1 | Tail1], Tail2, TailRes).

% ?-forall(merge([1, 2, 4, 8], [3, 5], S), format('~w', [S])).
% [1,2,3,4,5,8]
