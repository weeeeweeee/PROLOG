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
	
% hs - has siblings
% ss - small
% od - older than tokar

% 16 задание
zad16:-Friends=[_,_,_],
	in_list(Friends,[slesar,_,_]),
	in_list(Friends,[tokar,_,_]),
	in_list(Friends,[svar,_,_]),
	in_list(Friends,[_,borisov,_]),
	in_list(Friends,[_,ivanov,_]),
	in_list(Friends,[_,semenov,_]),
	in_list(Friends,[slesar,_,ss]),
	in_list(Friends,[_,borisov,hs]),
	in_list(Friends,[_,semenov,od]),
	not(in_list(Friends,[slesar,_,od])),
	not(in_list(Friends,[slesar,_,hs])),
	write(Friends),nl,!.
	
% 17 задание
% B справа от A
right(_,_,[_]):-fail.
right(A,B,[A|[B|_]]).
right(A,B,[_|List]):-right(A,B,List).

% B слева от A
left(_,_,[_]):-fail.
left(A,B,[B|[A|_]]).
left(A,B,[_|List]):-left(A,B,List).

% B около A
near(A,B,List):-right(A,B,List).
near(A,B,List):-left(A,B,List).

zad17:- Drinks=[_,_,_,_],
	in_list(Drinks,[bottle,_]),
	in_list(Drinks,[glass,_]),
	in_list(Drinks,[kuvshin,_]),
	in_list(Drinks,[jar,_]),
	in_list(Drinks,[_,milk]),
	in_list(Drinks,[_,lemonade]),
	in_list(Drinks,[_,kvas]),
	in_list(Drinks,[_,aqua]),
	not(in_list(Drinks,[bottle,milk])),
	not(in_list(Drinks,[bottle,aqua])),
	not(in_list(Drinks,[jar,lemonade])),
	not(in_list(Drinks,[jar,aqua])),
	(right([kuvshin,_],[_,lemonade],Drinks),
	right([_,lemonade],[_,kvas],Drinks);
	right([_,kvas],[_,lemonade],Drinks),
	right([_,lemonade],[kuvshin,_],Drinks)),
	near([glass,_],[jar,_],Drinks),
	near([glass,_],[_,milk],Drinks),
	write(Drinks),nl,!.
	
zad18:-  Gentlemen=[_,_,_,_],
	in_list(Gentlemen,[voronov,_]),
	in_list(Gentlemen,[pavlov,_]),
	in_list(Gentlemen,[levick,writer]),
	in_list(Gentlemen,[sugarov,_]),
	in_list(Gentlemen,[_,dancer]),
	in_list(Gentlemen,[_,artman]),
	in_list(Gentlemen,[_,singer]),
	not(in_list(Gentlemen,[voronov,singer])),
	not(in_list(Gentlemen,[levick,singer])),
	not(in_list(Gentlemen,[pavlov,artman])),
	not(in_list(Gentlemen,[voronov,artman])),
	write(Gentlemen),nl,!.

zad19:- Friends=[_,_,_],
  in_list(Friends,[michael,_,bb,_]),
  in_list(Friends,[simon,israel,_,_]),
  in_list(Friends,[richard,_,_,_]),
  in_list(Friends,[_,american,_,_]),
  in_list(Friends,[_,australian,_,_]),
  in_list(Friends,[_,_,cricket,first]),
  in_list(Friends,[_,_,tennis,_]),
  in_list(Friends,[_,_,_,second]),
  in_list(Friends,[_,_,_,third]),
  not(in_list(Friends,[michael,american,_,_])),
  not(in_list(Friends,[simon,_,tennis,_])),
  not(in_list(Friends,[michael,_,_,third])),
  not(in_list(Friends,[simon,_,_,third])),
  write(Friends),nl,!.
  

check_unique([],true).
check_unique([[_,_,false]|T],true):-check_unique(T,true).
check_unique([[_,_,true]|_],true):-fail.
check_unique([[_,_,false]|T]):-check_unique(T).
check_unique([[_,_,true]|T]):-check_unique(T,true).


check_one([],0).
check_one([],1).
check_one(_,2):-fail. 
check_one([[_,false,_]|T],N):-N1 is N+1,check_one(T,N1).
check_one([[_,true,_]|T],N):-check_one(T,N).
check_one([[_,false,_]|T]):-check_one(T,1).
check_one([[_,true,_]|T]):-check_one(T,0).

zad20:- Children=[_,_,_,_,_],
	in_list(Children,[andrew,_,_]),
	in_list(Children,[vitya,_,_]),
	in_list(Children,[dima,_,_]),
	in_list(Children,[yura,_,_]),	
	in_list(Children,[kolya,true,_]),
	in_list(Children,[_,true,_]),
	in_list(Children,[_,false,_]),
	in_list(Children,[_,_,false]),
	in_list(Children,[_,_,true]),
	(in_list(Children,[andrew,true,_])->
		(in_list(Children,[vitya,_,true]);
		in_list(Children,[kolya,_,true]));
		not((in_list(Children,[vitya,_,true]);
		in_list(Children,[kolya,_,true])))),
	(in_list(Children,[vitya,true,_])-> (
		in_list(Children,[vitya,_,false]),
		in_list(Children,[yura,_,false]));
		not((in_list(Children,[vitya,_,false]),
		in_list(Children,[yura,_,false])))),
	(in_list(Children,[dima, true, _])-> (
		(in_list(Children,[andrew,true,_]),
		in_list(Children,[vitya,false,_]));
		(in_list(Children,[andrew,false,_]),
		in_list(Children,[vitya,true,_])));true), 
	(in_list(Children,[yura,true,_])->
		in_list(Children,[dima,false,_]);
		in_list(Children,[dima,true,_])),
	check_one(Children),
	check_unique(Children),
	write(Children),nl,!.