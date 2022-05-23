prime(X,X):- true,!.
prime(X,Y):- X>Y, 0 is X mod Y -> false;Y1 is Y+1,prime(X,Y1).
prime(X):- X>1,prime(X,2),!;false,!.

in_list([],_):-fail.
in_list([H|_],H).
in_list([_|T],El):-in_list(T,El).

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
dividers(1,_,[]).
dividers(N,P,[H|T]):-prime(P),0 is N mod P,N1 is N div P,H is P,dividers(N1,2,T);P1 is P+1,dividers(N,P1,[H|T]).
dividers(N,OUT):-dividers(N,2,OUT),!.

% 14 задание
zad14:-Hair = [_,_,_],
	in_list(Hair,[belokurov,_]),
	in_list(Hair,[ryzhov,_]),
	in_list(Hair,[chernov,_]),
	in_list(Hair,[_,blondin]),
	in_list(Hair,[_,ryzhiy]),
	in_list(Hair,[_,brunet]),
	not(in_list(Hair,[belokurov,blondin])),
	not(in_list(Hair,[ryzhov,ryzhiy])),
	not(in_list(Hair,[chernov,brunet])),
	write(Hair),nl,!.
	
% 15 задание
zad15:-Friends=[_,_,_],
	in_list(Friends,[anya,X,X]),
	in_list(Friends,[valya,_,_]),
	in_list(Friends,[natasha,_,green]),
	in_list(Friends,[_,white,_]),
	in_list(Friends,[_,green,_]),
	in_list(Friends,[_,blue,_]),
	in_list(Friends,[_,_,white]),
	in_list(Friends,[_,_,green]),
	in_list(Friends,[_,_,blue]),
	not(in_list(Friends,[valya,white,_])),
	not(in_list(Friends,[valya,_,white])),
	not(in_list(Friends,[valya,X1,X1])),
	not(in_list(Friends,[natasha,X2,X2])),
	write(Friends),nl,!.
	
