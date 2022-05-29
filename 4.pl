% 1.1 задание

read_str(S,N):-get0(X),r_str(S,N,0,[],X).
r_str(S,N,N,S,10):-!.
r_str(S,N,K,TS,X):-NewK is K + 1,append(TS,[X],NewTS),get0(NewX),r_str(S,N,NewK,NewTS,NewX).

write_str([]):-nl.
write_str([H|T]):-put(H),write_str(T).

task1:-read_str(S,N),write_str(S),write_str(S),write_str(S),write("Symbol count:"),write(N).


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

task2:-read_str(S,_),count_words(S,N),write(N),nl.
