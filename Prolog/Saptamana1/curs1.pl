mama(ana, ion).
mama(ana, mihai).
mama(irina, ionut).
mama(ana, irina).

tata(gigi, ion).
tata(george, ionut).

/*

Interogatii
?- mama(X,ion).
X = ana.

?- mama(ana,X).
X = ion ;
X = mihai ;
X = irina.

?- mama(ana,ion).
true.

?- mama(X,Y).
X = ana,
Y = ion ;
X = ana,
Y = mihai ;
X = irina,
Y = ionut ;
X = ana,
Y = irina.

?- */