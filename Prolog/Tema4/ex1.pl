combination(0, _, []).
combination(K, [Head|Tail], [Head|Comb]) :-
    K1 is (K - 1),
    combination(K1, Tail, Comb).

combination(K, [_|Tail], Comb) :-
    K > 0,
    combination(K, Tail, Comb).

main(List):-
    findall(X,combination(2,List,X),Result),
    write(Result).
