/*
*Scrieți un predicat care determina cea mai lungă secvență de numere pare consecutive.
*/
pushFront(Item, List, [Item|List]).

succesor(X,[X,Y|_],Y).
succesor(_,[],-1).
succesor(X,[_|Z],Y):-
    succesor(X,Z,Y).

reverse([],ListResult,ListResult).
reverse([Head|Tail],ListResult,List):-
    reverse(Tail,ListResult,[Head|List]).

size([],0).
size([_|Tail],SizeRes):-
    size(Tail,Size),
    SizeRes is Size+1.

max3(LR, LT,ResTemp,_,ResTemp) :- LR >LT, !.
max3(LR, LT,_,Temp, Temp) :- LR =< LT.

longest_even_sequence(ListInit,ListResult):-
    longest_even_sequence(ListInit,[],TempResult),
    reverse(TempResult,ListResult,[]).

longest_even_sequence([],List,List).
longest_even_sequence([],[],[]).

longest_even_sequence([Head|Tail],Temp,Result):-
    Head mod 2=:=0,
    longest_even_sequence(Tail,[Head|Temp],Result).

longest_even_sequence([Head|Tail],Temp,Result):-
    Head mod 2 =\=0,
    longest_even_sequence(Tail,[],ResTemp),
    size(ResTemp,LR),
    size(Temp,LT),
    max3(LR,LT,ResTemp,Temp,Result).

consecutive(InitList,ListResult):-
    consecutive(InitList,[],TempResult),
    reverse(TempResult,ListResult,[]).

consecutive([],List,List).
consecutive([],[],[]).

consecutive([H|Tail],Temp,Result):-
    succesor(H,[H|Tail],Succ),
    Succ=\= -1,
    H<Succ,
    consecutive(Tail,[H|Temp],Result).

consecutive([H|Tail],Temp,Result):-
    succesor(H,[H|Tail],Succ),
    Succ=\= -1,
    H>Succ,
    pushFront(H,Temp,CopyTemp),
    consecutive(Tail,[],ResTemp),
    size(ResTemp,LR),
    size(CopyTemp,LT),
    max3(LR,LT,ResTemp,CopyTemp,Result).

consecutive([H],Temp,Result):-
    pushFront(H,Temp,Result).

even_consecutive_sequence([],[]).

even_consecutive_sequence(InitList,Result):-
    consecutive(InitList,TempResult),
    longest_even_sequence(TempResult,Result1),
    longest_even_sequence(InitList,TempResult2),
    consecutive(TempResult2,Result2),
    size(Result1,Size1),
    size(Result2,Size2),
   max3(Size1,Size2,Result1,Result2,Result) .


/*
 * subpunctul b
    */

even_consecutive_sequence_eterogen([],[]).
even_consecutive_sequence_eterogen([Head|Tail],Result):-
    is_list(Head),
    even_consecutive_sequence(Head,ListResult),
    even_consecutive_sequence_eterogen(Tail,TempRes),
    pushFront(ListResult,TempRes,Result).

even_consecutive_sequence_eterogen([Head|Tail],Result):-
    even_consecutive_sequence_eterogen(Tail,ListResult),
    pushFront(Head,ListResult,Result).
