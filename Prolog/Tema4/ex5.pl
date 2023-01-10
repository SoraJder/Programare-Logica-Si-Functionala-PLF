selec([Head|Tail],Head,Tail).
selec([Head|Tail],Element,[Head|S]) :-
      selec(Tail,Element,S).

member2(X,[X|_]).
member2(X,[_|Tail]) :- member2(X,Tail).

aux(List,K,[Head|Tail]):-
    K > 1,
    selec(List, Head, TailRes),
    K1 is K-1,
    aux(TailRes, K1, Tail).

aux(List, 1, [X]) :- member2(X, List).

main_arrangements(L, N):-
    findall(X, aux(L, N, X), R),
    write("Result = "),
    write(R).
