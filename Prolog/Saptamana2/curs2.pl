ploios(londra).
ploios(bangkok).
plictisitor(X):-
    ploios(X).

factorial(0,1).
factorial(N,F):-
    N1 is N-1,
    factorial(N1,F1),
    F is F1*N.
