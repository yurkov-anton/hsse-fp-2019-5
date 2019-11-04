% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

% Сначала получаем в Left - элементы из Tail меньше X, в Right - больше
% рекурсивно получаем отсортированную левую часть - и отсортированную правую
% результирующий список - это отсортированная левая часть, затем X, затем отсортированная правая
qsort([],[]).   

qsort([X|Tail], SortedResult) :-         
	qsplit(X, Tail, Left, Right),
	qsort(Left, SortedLeft),
	qsort(Right, SortedRight),
	append(SortedLeft, [X|SortedRight], SortedResult).

% qsplit(X,Y,U,W) - Элементы из Y, которые меньше X, идут в список U, остальные - в W
qsplit(X, [],[],[]).
qsplit(X, [Y|Tail], [Y|Left], Right) :- X > Y, qsplit(X, Tail, Left, Right).
qsplit(X, [Y|Tail], Left, [Y|Right]) :- qsplit(X, Tail, Left, Right).
