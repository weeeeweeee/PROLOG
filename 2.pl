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