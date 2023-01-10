/* Family Tree Program */

/* facts */
male(jack).
male(bill).
male(john).
female(dorothy).
female(evelyn).
female(grace).
female(liz).
parent(dorothy, evelyn).
parent(jack, evelyn).
parent(jack, grace).
parent(bill, liz).
parent(evelyn, liz).
parent(bill, john).
parent(evelyn, john).

/* rules */
mother(M,X):-
parent(M,X),
female(M).

father(F,X):-
parent(F,X),
male(F).

grandparent(G, X):-
parent(G,P),
parent(P,X).

sister(S,X):-
parent(Z,X),
parent(Z,S),
female(S),
not(S=X).

brother(B,X):-
parent(Z,X),
parent(Z,B),
male(B),
not(B=X).

grandfather(G,X):-
parent(G,P),
parent(P,X),
male(G).

grandmother(G,X):-
parent(G,P),
parent(P,X),
female(G).

findMother:-
write('Whose mother do you want to find?'),
read(Name),
mother(X,Name),
write('The mother of '), write(Name), write(' is '), write(X),nl.

findBrother:-
write('Whose brother do you want to find?'),
read(Name),
brother(X,Name),
write('The brother of '),write(Name), write(' is '), write(X), nl.

findGrandmother:-
write('Whose grandmother do you want to find?'),
read(Name),
grandmother(X,Name),
write('The grandmother of '),write(Name), write(' is '), write(X), nl.

findGrandmfather:-
write('Whose grandfather do you want to find?'),
read(Name),
grandfather(X,Name),
write('The grandfather of '),write(Name), write(' is '), write(X), nl.

