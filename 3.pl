prime(X,X):- true,!.
prime(X,Y):- X>Y, 0 is X mod Y -> false;Y1 is Y+1,prime(X,Y1).
prime(X):- X>1,prime(X,2),!;false,!.

% 11 задание (1.40)
even([],_):-false.
even([H|T],Out):-0 is H mod 2,Out is H;even(T,Out),!.

min_even([],M,M).
min_even([H|T],M,OUT):-(H<M,0 is H mod 2,M1 is H;M1 is M),min_even(T,M1,OUT).
min_even(LST,OUT):-even(LST,E),min_even(LST,E,OUT),!.

% 12 задание (1.46)
negative([],_).
negative([H|T],O):-H<0,O is H;negative(T,O).

positive([],_).
positive([H|T],O):-H>0,O is H;positive(T,O).

n_and_p(LST,O):-negative(LST,O),positive(LST,O).

% 13 задание (1.52)

rev([],Z,Z).
rev([H|T],Z,Acc):-rev(T,Z,[H|Acc]).

dividers(1,_,L,L).
dividers(N,P,L,OUT):-prime(P),0 is N mod P,N1 is N div P,dividers(N1,2,[P|L],OUT);P1 is P+1,dividers(N,P1,L,OUT).
dividers(N,OUT):-dividers(N,2,[],OUT1),rev(OUT1,OUT,[]),!.