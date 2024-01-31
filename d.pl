a.pl
% A state is legal if there are no negative numbers of people, and if there are no more cannibals than missionaries on either bank of the river.
legal_moves((CL,ML,_,CR,MR),(CL2,ML2,_,CR2,MR2)) :-
    ML>=0, % Check if missionaries on state 1 are greater than or equal to 0
	ML2>=0, % Check if missionaries on state 2 are greater than or equal to 0
    CL>=0, % Check if cannibals on state 1 is greater than or equal to 0
	CL2>=0, % Check if cannibals on state 2 is greater than or equal to 0
    MR>=0, % Check if missionaries on state 1 are greater than or equal to 0
	MR2>=0, % Check if missionaries state 2 are greater than or equal to 0
    CR>=0, %  Check if cannibals on state 1 are greater than or equal to 0
	CR2>=0, %  Check if cannibals on state 2 are greater than or equal to 0
    (ML>=CL ; ML=0), % Check if there are no more cannibals than missionaries on the 1 state or if there are no missionaries on the 1 state
    (ML2>=CL2 ; ML2=0), % Check if there are no more cannibals than missionaries on the 2 state or if there are no missionaries on the 2 state
    (MR>=CR ; MR=0), % Check if there are no more cannibals than missionaries on the 1 state or if there are no missionaries on the 1 state
    (MR2>=CR2 ; MR2=0). % Check if there are no more cannibals than missionaries on the 2 state or if there are no missionaries on the 2 state

    
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
    
    legal_moves((CL,ML,_,CR,MR),(CL2,ML2,_,CR2,MR2)) :-
        ML>=0, % Check if missionaries on state 1 are greater than or equal to 0
        ML2>=0, % Check if missionaries on state 2 are greater than or equal to 0
        CL>=0, % Check if cannibals on state 1 is greater than or equal to 0
        CL2>=0, % Check if cannibals on state 2 is greater than or equal to 0
        MR>=0, % Check if missionaries on state 1 are greater than or equal to 0
        MR2>=0, % Check if missionaries state 2 are greater than or equal to 0
        CR>=0, %  Check if cannibals on state 1 are greater than or equal to 0
        CR2>=0, %  Check if cannibals on state 2 are greater than or equal to 0
        (ML>=CL ; ML=0), % Check if there are no more cannibals than missionaries on the 1 state or if there are no missionaries on the 1 state
        (ML2>=CL2 ; ML2=0), % Check if there are no more cannibals than missionaries on the 2 state or if there are no missionaries on the 2 state
        (MR>=CR ; MR=0), % Check if there are no more cannibals than missionaries on the 1 state or if there are no missionaries on the 1 state
        (MR2>=CR2 ; MR2=0). % Check if there are no more cannibals than missionaries on the 2 state or if there are no missionaries on the 2 state
    
    
    path(Ini, Ini, _, []).
    
    path(Ini, Fin, Visited, [move(CL, ML, Dir, CR, MR)|Path]):-
    move(CL, ML, Dir, CR, MR),
    mov(move(CL, ML, Dir, CR, MR), Ini, Aux),
    \+ not_valid(Aux),
      \+ member(Aux, Visited),
    path(Aux, Fin, [Aux|Visited], Path).	 
    
    :- path(state(3,3, left), state(0,0, right), [state(3,3, left)], Path), write(Path), nl, fail.