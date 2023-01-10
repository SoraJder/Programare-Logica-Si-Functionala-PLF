even_numbers([],[]).
even_numbers([Head|Tails],Result):-
    even_numbers(Tails,TempResult),
    0=:=mod(Head,2),
    Result=[Head|TempResult].

even_numbers([_|Tails],Result):-
    even_numbers(Tails,Temp),
    Result=Temp.

odd_numbers([],[]).
odd_numbers([Head|Tail],Result):-
    odd_numbers(Tail,TempResult),
    0=\=mod(Head,2),
    Result=[Head|TempResult].

odd_numbers([_|Tail],Result):-
    odd_numbers(Tail,Temp),
    Result=Temp.

size([],0).
size([_|Tail],Size):-
    size(Tail,SizeTemp),
    Size is SizeTemp+1.

main(InitList,Result,SizeOdd,SizeEven):-
    odd_numbers(InitList,OddNumbers),
    even_numbers(InitList,EvenNumbers),
    Result=[OddNumbers,EvenNumbers],
    size(OddNumbers,SizeOdd),
    size(EvenNumbers,SizeEven).
