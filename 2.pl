% 4 вариант
nod(A,0,A):-!.
nod(A,B,X):-C is A mod B,nod(B,C,X),!.

even(X):- (X mod 2) =:= 0 .
coprime(X,Y):- nod(X,Y,Z), Z = 1.

% 11 задание 
% рекурсия вверх 
count_impl(X,1,CNT):- CNT is 0.
count_impl(X,Y,CNT):- Y>1, NY is Y-1, count_impl(X,NY,NCNT),(coprime(X,NY),CNT is NCNT;CNT is NCNT+1),!.

countnotprime(X,Y):-count_impl(X,X,Y).