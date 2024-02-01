
mov(move(M, C, left), state(ML, CL, right), state(ML2, CL2, left)):-  
ML2 is ML + M, ML2 >= 0, ML2 =< 3,
CL2 is CL + C, CL2 >= 0, CL2 =< 3.

mov(move(M, C, right), state(ML, CL, left), state(ML2, CL2, right)):-
ML2 is ML - M, ML2 >= 0, ML2 =< 3, 
CL2 is CL - C, CL2 >= 0, CL2 =< 3.	 

move(1,1,_).
move(2,0,_).
move(0,2,_).
move(1,0,_).
move(0,1,_).

not_valid(state(2,3, _)).
not_valid(state(1,3, _)).
not_valid(state(1,2, _)).
not_valid(state(2,1, _)). 
not_valid(state(1,0, _)).
not_valid(state(2,0, _)).

path(Ini, Ini, _, []).

path(Ini, Fin, Visited, [move(M, C, Dir)|Path]):-
move(M, C, Dir),
mov(move(M, C, Dir), Ini, Aux),
\+ not_valid(Aux),
  \+ member(Aux, Visited),
path(Aux, Fin, [Aux|Visited], Path).	 

:- path(state(3,3, left), state(0,0, right), [state(3,3, left)], Path), write(Path), nl, fail.