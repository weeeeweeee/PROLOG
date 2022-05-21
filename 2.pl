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

