insert(X, [], [X]):- !.
insert(X, [Y|Tail], [X, Y|Tail]):- X=<Y, !.
insert(X, [Y|Tail2], [Y|Tail]):- insert(X, Tail2, Tail).

insertion_sort([], []):- !.
insertion_sort([Head|Tail], Result):- insertion_sort(Tail, TempList), insert(Head, TempList, Result).

/*
subpunctul b
*/

push_front(Item, List, [Item|List]).

insertion_sort_eterogen([],[]):-!.

insertion_sort_eterogen([Head|Tail], Result):-
    is_list(Head),
    insertion_sort(Head,ListRes),
    insertion_sort_eterogen(Tail,TempRes),
    push_front(ListRes,TempRes,Result).

insertion_sort_eterogen([Head|Tail],Result):-
    insertion_sort_eterogen(Tail,ListRes),
    push_front(Head,ListRes,Result).
