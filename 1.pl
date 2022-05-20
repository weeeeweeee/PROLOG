man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

% 4 вариант
% 11 задание
father(X,Y):-man(X),parent(X,Y),!.
father(X):-father(Y,X),write(Y),nl,!.

% 12 задание
wife(X,Y):-woman(X),parent(X,Z),parent(Y,Z),!.
wife(X):-wife(Y,X),write(Y),nl,!.

% 13 задание
grand_ma(X,Y):-woman(X),parent(X, Z),parent(Z,Y),!.
grand_mas(X):-grand_ma(Y,X),write(Y),nl,fail.

% 14 задание
grand_ma_and_son(X,Y):-man(Y),grand_ma(X,Y),!;man(X),grand_ma(Y,X),!.

% 15 задание
nummult_up(X,Y):- X<10,Y is (X mod 10),!.
nummult_up(X,Y):- X>=10,K is (X div 10),nummult_up(K,Z),Y is (X mod 10) * Z,!.

% 16 задание
nummult_impl(X,Y,W):-X<10,N is (X mod 10), Z is (Y * N), W is Z,!.
nummult_impl(X,Y,W):-X>=10,N is (X div 10), Z is (Y * (X mod 10)),nummult_impl(N, Z, W),!.
nummult_down(X,Y):-nummult_impl(X,1,Y),!.

% 17 задание
max3_up(X,Y):-X<10,((N is X mod 3,N =:= 0, Y is X); Y is -1),!.
max3_up(X,Y):-X>=10,N is X div 10,max3_up(N,Z),M is X mod 10,((M mod 3 =:= 0,((M > Z, Y is M);Y is Z));Y is Z),!.

% 18 задание
max3_impl(X,Y,Z):-X<10,N is X mod 3,(N =:= 0,(X > Y,Z is X;Z is Y);Z is Y),!.
max3_impl(X,Y,Z):-X>=10,M is (X mod 10),((M mod 3) =:= 0,(M > Y, K is M;K is Y);K is Y),N is (X div 10),max3_impl(N,K,Z),!.
max3_down(X,Y):-max3_impl(X,-1,Y),!.

% 19 задание
fib(N,X):-N=<2,X is 1,!.
fib(N,X):-N>2, fib(N-1,F),fib(N-2,E),X is F+E,!.

% 20 задание
fib_impl(N,Z,_,_,M):-M=:=1,fib_impl(N,Z,0,1,M+1),!.
fib_impl(N,Z,_,_,M):-M=:=2,fib_impl(N,Z,1,1,M+1),!.
fib_impl(N,Z,X1,X2,M):-M<N,fib_impl(N,Z,X2,X1+X2,M+1),!.
fib_impl(N,Z,X1,X2,M):-M=:=N,Z is X1 + X2,!.

fib_d(N,X):-fib_impl(N,X,0,0,1),!.