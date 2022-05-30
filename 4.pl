% 1.1 задание

read_str(S,N):-get0(X),r_str(S,N,0,[],X).
r_str(S,N,N,S,10):-!.
r_str(S,N,K,TS,X):-NewK is K + 1,append(TS,[X],NewTS),get0(NewX),r_str(S,N,NewK,NewTS,NewX).

write_str([]):-nl.
write_str([H|T]):-put(H),write_str(T).

task1_1:-read_str(S,N),write_str(S),write_str(S),write_str(S),write("Symbol count:"),write(N).


% 1.2 задание

% false - пробельные символы
% true - непробельные символы

count_words([],N,_,N):-!.
count_words([32|T],N,false,V):-count_words(T,N,false,V).
count_words([_|T],N,false,V):-N1 is N+1,count_words(T,N1,true,V).
count_words([32|T],N,true,V):-count_words(T,N,false,V).
count_words([_|T],N,true,V):-count_words(T,N,true,V).
count_words([32|T],N):-count_words(T,N).
count_words([_|T],N):-count_words(T,1,true,N).

task1_2:-read_str(S,_),count_words(S,N),write(N),nl.



% 1.3 задание
in_list_exclude([H|T],H,T).
in_list_exclude([H|T],El,[H|Tail]):-in_list_exclude(T,El,Tail).

get_words([],[[]],_).
get_words([32|T],Tail,0):-get_words(T,Tail,0),!.
get_words([32|T],[[]|Tail],_):-get_words(T,Tail,0),!.
get_words([H|T],[[H|T2]|Tail],N):-N1 is N+1,get_words(T,[T2|Tail],N1),!.
get_words(List,Out):-get_words(List,Out,0).


count_item(List,El,C,V,Out):-in_list_exclude(List,El,List1),!,(C1 is C+1,count_item(List1,El,C1,V,Out));Out = List,V is C.
count_item(List,El,V,Out):-count_item(List,El,0,V,Out),!.

count_list([],[]).
count_list([H|T],[H2|T2]):-count_item([H|T],H,V,L2),H2 = [H,V],count_list(L2,T2).

find_max([],_,Item,Item).
find_max([[H1,H2]|T],Max,Item,Out):-(Max < H2,Max1 is H2,Item1 = H1;Max1 is Max,Item1 = Item),find_max(T,Max1,Item1,Out).
find_max([[H1,H2]|T],Out):-find_max(T,H2,H1,Out),!.

task1_3:-read_str(S,_),get_words(S,S1),count_list(S1,Out),find_max(Out,MAX),write_str(MAX).

% 1.4 задание
len([],C,V):-V is C.
len([_|T],C,V):-C1 is C+1,len(T,C1,V).
len([H|T],V):-len([H|T],0,V).

first_three([H1,H2,H3|_]):-put(H1),put(H2),put(H3),nl,!.

last_three([H1,H2,H3|[]]):-put(H1),put(H2),put(H3),nl,!.
last_three([_|T]):-last_three(T).

put_n_times(_,0):-!.
put_n_times([H|T],N):-N1 is N-1,put(H),put_n_times([H|T],N1).

task1_4:-read_str(S,N),(N>5,(first_three(S),last_three(S)),!;put_n_times(S,N)).

% 1.5 задание
last_symb([H|[]],H).
last_symb([_|T],V):-last_symb(T,V).

el_inds([],_,_,[]).
el_inds([H|T],H,C,[C|T2]):-C1 is C+1,el_inds(T,H,C1,T2).
el_inds([_|T],El,C,T2):-C1 is C+1,el_inds(T,El,C1,T2).
el_inds(List,El,Out):-el_inds(List,El,0,Out),!.

prnt([]):-nl,!.
prnt([H|T]):-write(H),write(' '),prnt(T).

task1_5:-read_str(S,_),last_symb(S,M),el_inds(S,M,Out),prnt(Out),!.


% 2.1 задание

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).
	
max_len([],_,V,V):-!.
max_len([H|T],M,MaxStr,Out):-len(H,V),(V>M,M1 is V,M2 = H;M1 is M,M2 = MaxStr),max_len(T,M1,M2,Out).
max_len([H|T],Out):-len(H,L),max_len(T,L,H,Out).

task2_1:-see('F:/PNew/PROLOG/2_1.txt'),read_list_str(List,_),seen,max_len(List,Out),write_str(Out),!.