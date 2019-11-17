	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5

	brother(X,Y) :- father(F,X), father(F,Y),Y\=X.
	cousin(X,Y) :- father(Father1,X), father(Father2,Y),brother(Father1,Father2).
	grandson(X,Y) :- father(Y,Father),father(Father,X).
	descendent(X,Y) :- grandson(X,Y); father(Y,X).

	/*?- brother(X,Y).
	X = b,
	Y = c ;

	X = c,
	Y = b ;

	X = d,
	Y = e ;

	X = e,
	Y = d ;

	?- cousin(X,Y).
	X = d,
	Y = f ;

	X = e,
	Y = f ;

	X = f,
	Y = d ;

	X = f,
	Y = e ;

	?- grandson(X,Y).
	X = d,
	Y = a ;

	X = e,
	Y = a ;

	X = f,
	Y = a ;

	?- descendent(X,Y).
	X = d,
	Y = a ;

	X = e,
	Y = a ;

	X = f,
	Y = a ;

	X = b,
	Y = a ;

	X = c,
	Y = a ;

	X = d,
	Y = b ;

	X = e,
	Y = b ;
	
	X = f,
	Y = c.

	*/