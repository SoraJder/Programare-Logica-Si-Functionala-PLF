sum([],0).
sum([_],0).
sum([_,Head|Tail],Sum):-
    sum(Tail,TailSum),
    Sum is  Head+TailSum.


product([],_,1).
product([Head|Tail],Pos,Product):-
    Pos1 is Pos+1,
    product(Tail,Pos1,TailProduct),
    0=:=mod(Pos,3),
    Product is Head*TailProduct.

product([_|Tail],Pos,Product):-
    Pos1 is Pos+1,
    product(Tail,Pos1,TailProduct),
    0=\=mod(Pos,3),
    Product is TailProduct.

gcd(X,0,X).

gcd(X,Y,X):-
    X=:=Y.

gcd(X,Y,R):-
    X<Y,
    Y1 is Y-X,
    gcd(X,Y1,R).

gcd(X,Y,R):-
    X>Y,
    gcd(Y,X,R).

abs_number(X,R):-
    X<0,
    R is -X.

abs_number(X,X).

main(InitList,Cmmdc):-
    sum(InitList,Sum),
    product(InitList,1,Product),
    abs_number(Sum,AbsSum),
    abs_number(Product,AbsProduct),
    gcd(AbsSum,AbsProduct,Cmmdc),
    writeln(AbsSum),
    writeln(AbsProduct).
