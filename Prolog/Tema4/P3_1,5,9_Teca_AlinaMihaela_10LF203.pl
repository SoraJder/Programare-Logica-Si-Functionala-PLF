/*
Teca Alina-Mihaela - 10LF203

Ex 1.

Scrieti un predicat care va genera o lista cu toate perechile formate de elementele listei.

Model matematic:

k=2
combination(k, l1..ln)
 [], k=0 daca
 l1 reunit combination(--k, l2..ln) altfel
 combination(k,l2..ln), k>0 daca

Cazuri testare:
    main_combination([2,3,5,6]).
    [[2,3],[2,5],[2,6],[3,5],[3,6],[5,6]]

    main_combination([2,3,4]).
    [[2,3],[2,4],[3,4]]
*/

combination(0, _, []).
combination(K, [Head|Tail], [Head|Comb]) :-
    K1 is (K - 1),
    combination(K1, Tail, Comb).

combination(K, [_|Tail], Comb) :-
    K > 0,
    combination(K, Tail, Comb).

main_combination(List):-
    findall(X,combination(2,List,X),Result),
    write(Result).

/*
Ex 5.
    Scrieti un predicat care determina   toate aranjamentele de k elementele ale  unei liste.

    Model matematic:

    selec(l1..ln, el)
    l2..ln, el=l1 daca,
    l1 reunit selec(l2..ln,el) altfel

    member2(x,l1..ln)
    true, x=l1 daca
    false, [] daca
    member2(x,l2..ln) altfel

    aux(l1..ln,k)
    {
        res =selec(l1..ln,l1)
        l1 reunit aux(res,--k)
    } k>1 daca
    l1, daca k=1

    Cazuri testare:

    main_arrangements([2,3,4],2).
    Result = [[2,3],[2,4],[3,2],[3,4],[4,2],[4,3]]

    main_arrangements([2,3,4],3).
    Result = [[2,3,4],[2,4,3],[3,2,4],[3,4,2],[4,2,3],[4,3,2]]

*/

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

/*
Ex. 9

Problema colorarii unei harti: Scrieti un predicat care determina toate variantele posibil de colorare a unei harti, tinand cont de urmatoarele conditii:
Sunt n tari/regiuni.
Sunt m culori disponibile.
Doua regiuni vecine nu pot avea aceeasi culoare.

    Model matematic:

    write_result(l1..ln)
    [], [] daca
    {
        scrie l1,
        write_result(l2..ln)
    } altfel

    check_invalid_constraints((country,color), l1..ln)
    false, [] daca
    false, daca color= l1.color
    check_invalid_constraints((country,color),l2..ln) altfel
    true

    aux(l1..ln)
    [], daca []
    {
        l1 reunit aux(l2..ln)
    } daca not (check_invalid_constraints(country,color,l2..ln))

    Cazuri testare:
    main_map().

    [(moldova,rosu),(dobrogea,albastru),(muntenia,verde),(oltenia,rosu),(banat,verde),(crisana,rosu),(maramures,verde),(transilvania,albastru)]
    [(moldova,rosu),(dobrogea,verde),(muntenia,albastru),(oltenia,rosu),(banat,albastru),(crisana,rosu),(maramures,albastru),(transilvania,verde)]
    [(moldova,albastru),(dobrogea,rosu),(muntenia,verde),(oltenia,albastru),(banat,verde),(crisana,albastru),(maramures,verde),(transilvania,rosu)]
    [(moldova,albastru),(dobrogea,verde),(muntenia,rosu),(oltenia,albastru),(banat,rosu),(crisana,albastru),(maramures,rosu),(transilvania,verde)]
    [(moldova,verde),(dobrogea,rosu),(muntenia,albastru),(oltenia,verde),(banat,albastru),(crisana,verde),(maramures,albastru),(transilvania,rosu)]
    [(moldova,verde),(dobrogea,albastru),(muntenia,rosu),(oltenia,verde),(banat,rosu),(crisana,verde),(maramures,rosu),(transilvania,albastru)]

*/



