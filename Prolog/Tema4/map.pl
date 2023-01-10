color(rosu).
color(albastru).
color(verde).
%color(galben).

nextTo(dobrogea,moldova).
nextTo(dobrogea,muntenia).
nextTo(moldova,transilvania).
nextTo(moldova,muntenia).
nextTo(transilvania,muntenia).
nextTo(transilvania,maramures).
nextTo(transilvania,crisana).
nextTo(transilvania,banat).
nextTo(transilvania,oltenia).
nextTo(muntenia,oltenia).
nextTo(oltenia,banat).
nextTo(banat,crisana).
nextTo(crisana,maramures).

neighbours(X,Y):- nextTo(X,Y),!.
neighbours(X,Y):- nextTo(Y,X).

check_invalid_constraints((_,_),[]):-fail.
check_invalid_constraints((Country,Color),[(Country2,Color2)|_]):-
    neighbours(Country,Country2),
    Color=Color2,
    !.

check_invalid_constraints((Country,Color),[_|Tail]):-
    check_invalid_constraints((Country,Color),Tail).

aux([],[]).
aux([Country|Tail],Result):-
    color(Color),
    aux(Tail,TempResult),
    not(check_invalid_constraints((Country,Color),TempResult)),
    Result=[(Country,Color)|TempResult].


write_result([]):-!.
write_result([Head|Tail]):-
    writeln(Head),
    write_result(Tail).

main_map():-
   findall(X,aux([moldova,dobrogea,muntenia,oltenia,banat,crisana,maramures,transilvania],X),Result),
   write_result(Result).

