minim([X],X).
minim([Head|Tail],Min):-
    minim(Tail,TailMin),
    Head<TailMin,
    Min is Head.

minim([_|Tail],Min):-
    minim(Tail,TailMin),
    Min is TailMin.

delete_min(_,[],[]).
delete_min(Term,[Term|Tail],Tail).
delete_min(Term,[Head|Tail],[Head|Result]):-
    delete_min(Term,Tail,Result).

main(List,ListResult):-
    minim(List,X),
    delete_min(X,List,ListResult).
