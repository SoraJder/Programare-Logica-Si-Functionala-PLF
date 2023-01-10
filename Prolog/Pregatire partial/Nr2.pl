succesor(X,[X,Y|_],Y).
succesor(_,[],-1).
succesor(X,[X,Y],Y).

predecesor(X,[Y,X|_],Y).
predecesor(X,[X|_],-1).
predecesor(X,[Y,X],Y).

