% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 
devide(_, [], [], []).
devide(Point, [Head|Tail], [Head|Left], Right) :-
    Point >= Head,
    devide(Point, Tail, Left, Right), !.
devide(Point, [Head|Tail], Left, [Head|Right]) :-
    devide(Point, Tail, Left, Right).

qsort([], []).
qsort([Head|Tail], Result) :-
    devide(Head, Tail, Left, Right),
    qsort(Left, LResult),
    qsort(Right, RResult),
    append(LResult, [Head|RResult], Result).


% Test
%?-qsort([8, 5, 9, 2, 3, 1, 9, 6, 34, 0], S)
%S = [0, 1, 2, 3, 5, 6, 8, 9, 9, 34]