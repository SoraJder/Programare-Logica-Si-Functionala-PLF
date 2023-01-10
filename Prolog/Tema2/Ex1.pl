maxList([X],X).

maxList([Head|Tail],Max):-
    maxList(Tail,TailMax),
    Head=<TailMax,
    Max is TailMax.

maxList([Head|Tail],Max):-
    maxList(Tail,TailMax),
    Head>TailMax,
    Max is Head.

minList([X],X).

minList([Head|Tail],Min):-
    minList(Tail,TailMin),
    Head>=TailMin,
    Min is TailMin.

minList([Head|Tail],Min):-
    minList(Tail,TailMin),
    Head<TailMin,
    Min is Head.

gcd(X,Y,R):-
    X=:=Y,
    R is X.

gcd(X,Y,R):-
    X<Y,
    Y1 is Y-X,
    gcd(X,Y1,R).

gcd(X,Y,R):-
    X>Y,
    gcd(Y,X,R).

/*
 * listGCD([17,16,18,20,24,21]).
 * Raspuns:8
 */

listGCD(L):-
    minList(L,X),
    maxList(L,Y),
    gcd(X,Y,R),
    write(R).
