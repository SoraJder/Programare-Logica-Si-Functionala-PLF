/*
Teca Alina-Mihaela, grupa 10LF203
*/

/*
Predicate folosite global:
*/
push_front(Item, List, [Item|List]).

reverse([],ListResult,ListResult).
reverse([Head|Tail],ListResult,List):-
    reverse(Tail,ListResult,[Head|List]).

/*
(a) Sortati elementele unei liste, cu pastrarea elementelor duplicate.
            (b) Pentru o lista Eterogena, formata din numere intregi si liste de numere, scrieti un predicat care sorteaza elementele sublistelor, cu pastrarea valorilor duplicate.
    Exemplu: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] => [1, 2, [1, 4, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1, 1, 1], 7].

Model matematic:
insert(l1..ln, elem)
    [elem], daca []
    elem reunit cu l1 reunit cu l2..ln, daca elem<=l1
    insert(l2..ln,elem) altfel

insertion_sort(l1..ln,result)
    result=[], daca []
    {
        insertion_sort(l2..ln,tempRes),
        insert(tempRes,l1)
    }  altfel

   insertion_sort_eterogen(l1..ln,result)
   result=[], daca []
    {
        insertion_sort(l1,resultList1)
        resultList1 reunit insertion_sort_eterogen(l2..ln,result)
    }, daca l1 e lista
    l1 reunit insertion_sort_eterogen(l2..ln,result) altfel

Cazuri testare
    a)
        insertion_sort([871,24,3,44,12],R).
            R = [3, 12, 24, 44, 871].
        insertion_sort([871,24,3,24,44,12],R).
            R = [3, 12, 24, 24, 44, 871].

    b)insertion_sort_eterogen([1, 2, [4, 1, 4],6, [7, 10, 1, 3, 9],[1, 1, 1], 7],X).
    X = [1, 2, [1, 4, 4], 6, [1, 3, 7, 9, 10], [1, 1, 1], 7]

*/

insert(X, [], [X]):- !.
insert(X, [Y|Tail], [X, Y|Tail]):- X=<Y, !.
insert(X, [Y|Tail2], [Y|Tail]):- insert(X, Tail2, Tail).

insertion_sort([], []):- !.
insertion_sort([Head|Tail], Result):- insertion_sort(Tail, TempList), insert(Head, TempList, Result).

/*
subpunctul b
*/

insertion_sort_eterogen([],[]):-!.

insertion_sort_eterogen([Head|Tail], Result):-
    is_list(Head),
    insertion_sort(Head,ListRes),
    insertion_sort_eterogen(Tail,TempRes),
    push_front(ListRes,TempRes,Result).

insertion_sort_eterogen([Head|Tail],Result):-
    insertion_sort_eterogen(Tail,ListRes),
    push_front(Head,ListRes,Result).


/*
Ex 8
(a) Determinati succesorul unui numar reprezentat ca lista (fara a transforma lista in numar) EX: [9 9 9] = [1 0 0 0]
     (b) Pentru o lista Eterogena, formata din numere intregi si liste de numere, scrieti un predicat care determina succesorul numarului reprezentat ca sublista. 
[1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] => [1, [2, 4], 4, 5, [6, 8, 0], 10, 11, [1, 2, 1], 6]


Model matematic:

reverse(l1..ln)
    [], [] daca
    reverse(l2..ln) reunit cu l1, alfel

sum(l1..ln,tr)
    [1], daca tr=1 si l=[]
    [], daca tr!=1 si l=[]
    {
        s= l1+tr,
        l1= s mod 10,
        tr1= s div 10
        l1 reunit sum(l2..ln)
    } altfel


succesor_eterogen(l1..ln,result)
    result=[], daca []
    {
        succesor_list(l1,resultList1)
        resultList1 reunit succesor_eterogen(l2..ln,result)
    }, daca l1 e lista
    l1 reunit succesor_eterogen(l2..ln,result) altfel

 Cazuri testare:
  a)  succesor_list([4,5,6],L).
        L = [4, 5, 7].   

    succesor_list([4,5,9],L).
        L = [4, 6, 0].

    succesor_list([9,9,9],L).
        L = [1, 0, 0, 0] 

 b) succesor_eterogen([1, [2, 3], [6, 7, 9], 10, 11, [1, 2, 0]],L).
    L = [1, [2, 4], [6, 8, 0], 10, 11, [1, 2, 1]]

*/


sum([],1,[1]).
sum([],_,[]):- !.
sum([Head|Tail],Tr,[Sum|ListResult]):-
    S is Head+Tr,
    Sum is S mod 10,
    Tr1 is S div 10,
    sum(Tail,Tr1,ListResult).

succesor_list(InitList,ResultList):-
    reverse(InitList,TempList,[]),
    sum(TempList,1,TempList2),
    reverse(TempList2,ResultList,[]).

/*
 * subpunctul b)
*/

push_front(Item, List, [Item|List]).

succesor_eterogen([],[]).
succesor_eterogen([Head|Tail],Result):-
    is_list(Head),
    succesor_list(Head,ListR),
    succesor_eterogen(Tail,TempR),
    push_front(ListR,TempR,Result).

succesor_eterogen([Head|Tail],Result):-
    succesor_eterogen(Tail,ListR),
    Result=[Head|ListR].

/*
Ex 14

(a) Sortati elementele unei liste, cu pastrarea elementelor duplicate.
(b) Pentru o lista Eterogena, formata din numere intregi si liste de numere, scrieti un predicat care sorteaza elementele sublistelor, cu pastrarea valorilor duplicate.

Modele matematic folosite:

succesor(x,l1..ln)
  -1, [] daca
  l2, daca l1=x
  succesor(x, l2..ln) altfel

reverse(l1..ln)
    [], [] daca
    reverse(l2..ln) reunit cu l1, alfel

size(l1..ln)
    0, [] daca
    1+size(l2..ln) alfel

longest_even_sequence(l1..ln,result)
    restTemp =l1 reunit longest_even_sequence(l2..ln), l1 mod 2=0 daca
    { 
        temp=longest_even_sequence(l2..ln,[]), 
        daca size(restTemp)> size(temp)
            result=restTemp 
        altfel result=temp
    }, daca l1 mod 2!=0

consecutive(l1..ln,result)
    restTemp =l1 reunit consecutive(l2..ln), l1<l2 daca
    {
        temp=consecutive(l2..ln,[])
         daca size(restTemp)> size(temp)
            result=restTemp 
        altfel result=temp
    }, daca l1>l2
    [l1], daca [l1]

even_consecutive_sequence_eterogen(l1..ln, result)
    result=[], daca []
   {
    even_consecutive_sequence(l1,resultList1),
    resultList1 reunit even_consecutive_sequence_eterogen(l2..ln, result)
    }, daca l1 e lista
    l1 reunit even_consecutive_sequence_eterogen(l2..ln, result) altfel

Cazuri testare
    a) even_consecutive_sequence([1,2,3,4,5,2,4,6],R).
            R = [2, 4, 6] 

        even_consecutive_sequence([1,5,3],R).
            R = [] 

       even_consecutive_sequence([1,5,2,3],R).     
            R = [2] 

    b)even_consecutive_sequence_eterogen([1,3,[1,2,3,4,5,2,4,6],[2,4,6,8,1,1,1,10,12]],L).
            L = [1, 3, [2, 4, 6], [2, 4, 6, 8]] .

*/

succesor(X,[X,Y|_],Y).
succesor(_,[],-1).
succesor(X,[_|Z],Y):-
    succesor(X,Z,Y).

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
    push_front(H,Temp,CopyTemp),
    consecutive(Tail,[],ResTemp),
    size(ResTemp,LR),
    size(CopyTemp,LT),
    max3(LR,LT,ResTemp,CopyTemp,Result).

consecutive([H],Temp,Result):-
    push_front(H,Temp,Result).

even_consecutive_sequence([],[]).

even_consecutive_sequence(InitList,Result):-
    consecutive(InitList,TempResult),
    longest_even_sequence(TempResult,Result1),
    longest_even_sequence(InitList,TempResult2),
    consecutive(TempResult2,Result2),
    size(Result1,Size1),
    size(Result2,Size2),
    max3(Size1,Size2,Result1,Result2,Result).


/*
 * subpunctul b
    */

even_consecutive_sequence_eterogen([],[]).
even_consecutive_sequence_eterogen([Head|Tail],Result):-
    is_list(Head),
    even_consecutive_sequence(Head,ListResult),
    even_consecutive_sequence_eterogen(Tail,TempRes),
    push_front(ListResult,TempRes,Result).

even_consecutive_sequence_eterogen([Head|Tail],Result):-
    even_consecutive_sequence_eterogen(Tail,ListResult),
    push_front(Head,ListResult,Result).
