append([],X,X).
append([H|T],X,[H|T1]):-append(T,X,T1).

% 4 вариант
nod(A,0,A):-!.
nod(A,B,X):-C is A mod B,nod(B,C,X),!.

even(X):- (X mod 2) =:= 0 .
coprime(X,Y):- nod(X,Y,Z), Z = 1.
notcoprime(X,Y):- not(coprime(X,Y)).

% 11 задание 
% рекурсия вверх 
count_impl(_,1,CNT):- CNT is 0.
count_impl(X,Y,CNT):- Y>1, NY is Y-1, count_impl(X,NY,NCNT),(notcoprime(X,Y),even(Y),CNT is NCNT+1;CNT is NCNT),!.
countnotprime(X,Y):-NX is X-1,count_impl(X,NX,Y).

% рекурсия вниз
count_down(_,1,CNT,OUT):-OUT is CNT,!.
count_down(X,Y,CNT,OUT):-Y>1,NY is Y-1,(notcoprime(X,Y),even(Y),NCNT is CNT+1;NCNT is CNT),count_down(X,NY,NCNT,OUT).
count_down(X,Y):-NX is X-1,count_down(X,NX,0,Y),!.

% 12 задание
mindel(X,X,Z):-Z is X,!.
mindel(X,Y,Z):- X mod Y =:= 0,Z is Y;Y1 is Y + 1,mindel(X,Y1,Z).
mindel(X,Y):-mindel(X,2,Y),!.

maxnotcoprime(_,1,_,Z):-Z is 1,!.
maxnotcoprime(X,Y,D,Z):-Y mod D =\= 0,notcoprime(X,Y),Z is Y;Y1 is Y-1,maxnotcoprime(X,Y1,D,Z).
maxnotcoprime(X,Y):-X1 is X-1,mindel(X,D),maxnotcoprime(X,X1,D,Y),!.

numbsum(0,SUM,OUT):-OUT is SUM,!.
numbsum(X,SUM,OUT):-X > 0,NewX is X div 10, DIGIT is X mod 10,(DIGIT < 5,NSUM is SUM + DIGIT;NSUM is SUM),numbsum(NewX,NSUM,OUT). 
numbsum(X,Y):-numbsum(X,0,Y),!.

pred(X,Y):-maxnotcoprime(X,D),numbsum(X,A),Y is D*A.


% 13 задание
inc(X,X1):- X1 is X+1 .

less(A,B):-A<B,!.

prime(X,X):- true,!.
prime(X,Y):- X>Y, 0 is X mod Y -> false;Y1 is Y+1,prime(X,Y1).
prime(X):- X>1,prime(X,2),!;false,!.


count(B,C,CNT,N,Z):-NM is (N*N+B*N+C),(prime(NM),NCNT is CNT+1,NN is N+1,count(B,C,NCNT,NN,Z);Z is CNT),!.
count(B,C,Z):-count(B,C,0,0,Z).


polynom(999,999,M,PR,V):- count(999,999,M1),(M1>M,NPR is 999*999;NPR is PR),V is NPR,!.
polynom(B,C,M,PR,V):-THS is 1000,count(B,C,M1),(M1 > M,(MAX is M1,NPR is B*C);MAX is M,NPR is PR),(THS > C,(inc(C,C1),B1 is B);inc(B,B1),C1 is -999),polynom(B1,C1,MAX,NPR,V).

find(V):-polynom(-999,-999,0,0,V).

% 14 задание
% Найти длину списка
len([],C,V):-V is C.
len([_|T],C,V):-inc(C,C1),len(T,C1,V).
len([H|T],V):-len([H|T],0,V).

% 15 задание (1.3)
% Найти максимальный элемент
find_max([],M,V):-V is M.
find_max([H|T],M,V):-(H>M,MAX is H;MAX is M),find_max(T,MAX,V).
find_max([H|T],V):-find_max(T,H,V),!.

% Найти элемент по его индексу
find_ind([],_,_,_):- false.
find_ind([H|T],C,N,V):-C is N,V is H;inc(N,N1),find_ind(T,C,N1,V).
find_ind([H|T],C,V):-find_ind([H|T],C,0,V),!.

% Проверить равенство элемента по индексу C элементу M
check_ind([H|T],C,M):-find_ind([H|T],C,M1),M is M1.

% Проверить, является ли элемент по индексу N максимальным
check_max([H|T],N):-find_max([H|T],MAX),check_ind([H|T],N,MAX).

% 16 задание (1.4)
% найти индекс максимального элемента
find_ind_max([],_,MC,_,MC).
find_ind_max([H|T],M,MC,IND,V):-(H>M,MAX is H,MAXC is IND;MAX is M, MAXC is MC),inc(IND,IND1),find_ind_max(T,MAX,MAXC,IND1,V).
find_ind_max([H|T],V):-find_ind_max(T,H,0,1,V),!.

% удаление элемента по индексу
del([],_,_,_).
del([_|T],C,C,T).
del([H|T],IND,C,[H|L]):-inc(IND,IND1),del(T,IND1,C,L),!.
del([H|T],C,A):-del([H|T],0,C,A).

% отсортировать список по убыванию
sorted([],_):-!.
sorted([H|T],[L|T1]):-find_max([H|T],L),find_ind_max([H|T],M),del([H|T],M,NL),sorted(NL,T1),!.

% найти индекс элемента
find_el([],_,_,A):-A is -1,false.
find_el([H|T],IND,EL,A):-EL is H,A is IND,true;inc(IND,IND1),find_el(T,IND1,EL,A).
find_el([H|T],EL,A):-find_el([H|T],0,EL,A),!.

% найти список индексов элементов, образующих убывающую последовательность
sorted_ind([],_,_).
sorted_ind([H|T],LST,[H1|T1]):-find_el(LST,H,H1),sorted_ind(T,LST,T1).
sorted_ind(LIST,OUTPUT):-sorted(LIST,SCND),sorted_ind(SCND,LIST,OUTPUT),!.

% 17 задание (1.14)
interval([],_,_,CNT,CNT).
interval([H|T],A,B,CNT,CNTR):-((A=<H,B>=H),NCNT is CNTR+1;NCNT is CNTR),interval(T,A,B,CNT,NCNT).
interval(LIST,A,B,CNT):-interval(LIST,A,B,CNT,0),!.

