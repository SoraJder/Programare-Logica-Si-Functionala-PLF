sumList([],0).
sumList([_],0).
sumList([_,S|Tail],Sum):-
    sumList(Tail,Rest),
    Sum is S+Rest.

difList([],0).
difList([X],-X).
difList([D,_|Tail],Dif):-
    difList(Tail,Rest),
    Dif is D-Rest.

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

lcmList(List,Result):-
    sumList(List,Sum),
    difList(List,Dif),
    AbsDif is abs(Dif),
    gcd(Sum,AbsDif,GCDResult),
    Result is AbsDif*Sum/GCDResult.
/*
 * lcmList([1,2,3,4,5],X).
 * Raspuns: 42
 *
 * lcmList([16,2,3,4,5],R).
 * Raspuns:24
 */
