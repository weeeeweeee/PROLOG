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