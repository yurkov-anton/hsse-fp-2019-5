mrg([],[],[]).
mrg([], Y, Y).
mrg(X, [], X).
mrg([H1|List1], [H2|List2], [H1|List]) :- H1 =< H2,!,mrg(List1,[H2|List2],List).
mrg([H1|List1], [H2|List2], [H2|List]) :- mrg([H1|List1],List2,List).
