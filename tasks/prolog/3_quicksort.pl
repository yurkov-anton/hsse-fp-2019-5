qsort([],[]).   

qsort([Elem|Tail], Sorted) :- split(Elem, Tail, Less, Greater),
                              qsort(Less, LessSorted),
                              qsort(Greater, GreaterSorted),
                              append(LessSorted, [Elem|GreaterSorted], Sorted).

split(X, [], [], []).
split(X, [Y|Tail], [Y|Less], Greater) :- X > Y, split(X, Tail, Less, Greater).
split(X, [Y|Tail], Less, [Y|Greater]) :- split(X, Tail, Less, Greater).