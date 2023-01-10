/*ex 1 - inmultiti elementele uei liste cu o constanta */
mmul(_,[],[]).

mmul(K,[H|T],[HR|TR]):-
	HR is K*H,
	mmul(K,T,TR).


/*Varianta echivalenta
 * mmul(K,[H|T],R):-
	H1 is K*H,
	mmul(K,T,R1),
        R=[H1|R1].

*/

/*ex 2 - adaugati la finalul listei un element */

add([],E,[E]).
add([H|T],E,[H|R]):-
    add(T,E,R).
