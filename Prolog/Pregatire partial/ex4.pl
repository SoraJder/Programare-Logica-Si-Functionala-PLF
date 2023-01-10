maxList([Max],Max).

maxList([Head|Tail],Max):-
    maxList(Tail,TailMax),
    Head>TailMax,
    Max is Head.

maxList([_|Tail],Max):-
    maxList(Tail,TailMax),
    Max is TailMax.

pow_of_three(X,Y):-
    X is 1,
    Y is 1.

pow_of_three(X,Y):-
    X>0,
    0 is mod(X,3),
    H is div(X,3),
    pow_of_three(H,Y).

pow_of_three(X,Y):-
    X>0,
    0=\=mod(X,3),
    Y is 0.

add_element([],_,_,[]).

add_element([Head|Tail],Pos,X,ListResult):-
    Pos1 is Pos+1,
    add_element(Tail,Pos1,X,TempResult),
    pow_of_three(Pos,Y),
    Y is 1,
    ListResult=[Head,X|TempResult].

add_element([Head|Tail],Pos,X,ListResult):-
    Pos1 is Pos+1,
    add_element(Tail,Pos1,X,TempResult),
    pow_of_three(Pos,Y),
    Y is 0,
    ListResult=[Head|TempResult].



main([],[]).
main(List,ListResult):-
    maxList(List,X),
    add_element(List,1,X,Temp),
    ListResult=Temp.
