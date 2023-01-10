succesor(X,[X,Y|_],Y).
succesor(_,[],Y):-
    Y is 0.
succesor(X,[_|Z],Y):-
    succesor(X,Z,Y).

predecessor( X, [Y,X|_], Y).
predecessor(_,[],Y):-
    Y is 0.
predecessor( X, [_|Z], Y ) :- predecessor( X, Z, Y ).

pow_of_two(X,Y):-
    X is 1,
    Y is 1.

pow_of_two(X,Y):-
    X>0,
    0 is mod(X,2),
    H is div(X,2),
    pow_of_two(H,Y).

pow_of_two(X,Y):-
    X>0,
    0=\=mod(X,2),
    Y is 0.

add_elements(_,[],_,[]).

add_elements(ListInit,[Head|Tail],Pos,ListResult):-
    Pos1 is Pos+1,
    add_elements(ListInit,Tail,Pos1,TempResult),
    pow_of_two(Pos,Y),
    Y is 1,
    succesor(Head,[Head|Tail],X),
    predecessor(Head,ListInit,Z),
    Sum is X+Z,
    ListResult=[Head,Sum|TempResult].

 add_elements(ListInit,[Head|Tail],Pos,ListResult):-
    Pos1 is Pos+1,
    add_elements(ListInit,Tail,Pos1,TempResult),
    pow_of_two(Pos,Y),
    Y is 0,
    ListResult=[Head|TempResult].


main([],[]).

main(ListInit,ListResult):-
    add_elements(ListInit,ListInit,1,Temp),
    ListResult=Temp.
