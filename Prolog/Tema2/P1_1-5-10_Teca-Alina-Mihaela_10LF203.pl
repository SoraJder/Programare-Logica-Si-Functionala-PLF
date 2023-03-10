/*
Teca Alina-Mihaela, grupa 10LF203

1. Scrieți un predicat care calculează c.m.m.d.c. dintre minimul și maximul elementelor unei liste.

Model matematica:
maxList(l1..ln,max)
  [max] - lista goala,
   max= l1 daca l1>max,
   maxList(l2..ln, max) altfel

minList(l1..ln,min)
   [min]-lista goala
   min= l1 daca l1<min,
   minList(l2..ln,max) altfel

gcd(x,y)
   x, daca x=y,
   gcd(x,y-x,r) daca x<y
   gcd(y,x,r) altfel


Cazuri testare:
listGCD([17,16,18,20,24,21]).
 Raspuns:8

 listGCD([35,48,100,12]).
Raspuns:4

listGCD([76,84,28,56]).
Raspuns:28
*/


maxList([X],X).

maxList([Head|Tail],Max):-
    maxList(Tail,TailMax),
    Head=<TailMax,
    Max is TailMax.

maxList([Head|Tail],Max):-
    maxList(Tail,TailMax),
    Head>TailMax,
    Max is Head.

minList([X],X).

minList([Head|Tail],Min):-
    minList(Tail,TailMin),
    Head>=TailMin,
    Min is TailMin.

minList([Head|Tail],Min):-
    minList(Tail,TailMin),
    Head<TailMin,
    Min is Head.

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

listGCD(L):-
    minList(L,X),
    maxList(L,Y),
    gcd(X,Y,R),
    write(R).


/* Ex. 5
 * Scrieți un predicat care calculează c.m.m.m.c dintre dintre suma elementelor de pe poziții pare și diferența elementelor de pe poziții impare.
 *
 *Model matematic
 *
 *sumList(l1,l2..ln, sum)
 * 0, daca [] sau [l1]
 * sumList(l3,l4..ln,sum);sum=sum+l2 altfel
 *
 * difList(l1,l2..ln,dif)
 * 0, daca []
 * -l1, daca [l1],
 * difList(l3,l4..ln,dif);dif=dif-l1 altfel
 *
 * gcd(x,y)
   x, daca x=y,
   gcd(x,y-x) daca x<y
   gcd(y,x) altfel

 *
 * Cazuri testare
 *
 * lcmList([1,2,3,4,5],X).
 * Raspuns: 42
 *
 * lcmList([16,2,3,4,5],R).
 * Raspuns:24
 *
 */

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

lcmList(List,Result):-
    sumList(List,Sum),
    difList(List,Dif),
    AbsDif is abs(Dif),
    gcd(Sum,AbsDif,GCDResult),
    Result is AbsDif*Sum/GCDResult.

/*
    Ex 10.
Scrieți un predicat care să adauge după fiecare poziție putere a lui 2 suma dintre elemk_1 si elemK+1 .

Model matematic

succesor(x,l1..ln)
  0, [] daca
  l2, daca l1=x
  succesor(x, l2..ln) altfel

  predecesor(x,l1..ln)
  0, [] daca
  l1, daca l2=x
  predecesor(x,l2..ln) altfel

  pow_of_two(x)
  1 daca x=1
  0, daca x%2!=0
  pow_of_two(x/2) altfel

  appendTail(l1..ln, val)
  [val], daca [],
  l1 reunit appendTail(l2..ln,val) altfel

  Cazuri testare:
  succesor(2,[1,2,3,4],Y).
  Raspuns: 3
  succesor(4,[1,2,3,4],Y).
  Raspuns:0
  succesor(5,[1,2,3,4],Y).
  Raspuns:0

  predecessor(4,[1,2,3,4],Y).
  Raspuns:3
  predecessor(1,[1,2,3,4],Y).
  Raspuns:0

  pow_of_two(8,X).
  Raspuns:1
  pow_of_two(5,X).
  Raspuns:0

  appendTail([1,2,3,4],[5],L).
  Raspuns: [1,2,3,4,5]

*/


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

appendTail([],Y,Y).
appendTail([H|X],Y,[H|Z]):- appendTail(X,Y,Z).
