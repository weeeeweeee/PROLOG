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
