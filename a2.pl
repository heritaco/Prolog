
% Two missionaries cross from the left bank to the right bank:
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]):- % Two missionaries cross from the left bank to the right bank.
    CL2 is CL,   % Cannibals on state 2 is equal to cannibals on state 1
    ML2 is ML-2,  % Decrease the number of missionaries on the left bank by 2
    CR2 is CR, % Cannibals on state 2 is equal to cannibals on state 1
    MR2 is MR+2,  % Increase the number of missionaries on the right bank by 2
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% Two cannibals cross from the left bank to the right bank:
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]):- % Two cannibals cross from the left bank to the right bank.
    CL2 is CL-2, % Decrease the number of cannibals on the left bank by 2
    ML2 is ML, % Missioners on state 2 is equal to missionaries on state 1
    CR2 is CR+2, % Increase the number of cannibals on the right bank by 2
    MR2 is MR, % Missioners on state 2 is equal to missionaries on state 1
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% One missionary and one cannibal cross from the left bank to the right bank.
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]):-
    CL2 is CL-1, % Decrease the number of cannibals on the left bank by 1
    ML2 is ML-1, % Decrease the number of missionaries on the left bank by 1
    CR2 is CR+1, % Increase the number of cannibals on the right bank by 1
    MR2 is MR+1, % Increase the number of missionaries on the right bank by 1
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% One missionary crosses from the left bank to the right bank:
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]):- % One missionary crosses from the left bank to the right bank.
    CL2 is CL, % Cannibals on state 2 is equal to cannibals on state 1
    ML2 is ML-1, % Decrease the number of missionaries on the left bank by 1
    CR2 is CR, % Cannibals on state 2 is equal to cannibals on state 1
    MR2 is MR+1, % Increase the number of missionaries on the right bank by 1
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% One cannibal crosses from the left bank to the right bank:
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]):- % One cannibal crosses from the left bank to the right bank.
    CL2 is CL-1, % Decrease the number of cannibals on the left bank by 1
    ML2 is ML, % Missioners on state 2 is equal to missionaries on state 1
    CR2 is CR+1, % Increase the number of cannibals on the right bank by 1
    MR2 is MR, % Missioners on state 2 is equal to missionaries on state 1
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% Two missionaries cross from the right bank to the left bank:
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]):- % Two missionaries cross from the right bank to the left bank.
    CL2 is CL, % Cannibals on state 2 is equal to cannibals on state 1
    ML2 is ML+2, % Increase the number of missionaries on the left bank by 2
    CR2 is CR, % Cannibals on state 2 is equal to cannibals on state 1
    MR2 is MR-2, % Decrease the number of missionaries on the right bank by 2
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% Two cannibals cross from the right bank to the left bank:
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]):- % Two cannibals cross from the right bank to the left bank.
    CL2 is CL+2, % Increase the number of cannibals on the left bank by 2
    ML2 is ML, % Missioners on state 2 is equal to missionaries on state 1
    CR2 is CR-2, % Decrease the number of cannibals on the right bank by 2
    MR2 is MR, % Missioners on state 2 is equal to missionaries on state 1
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% One missionary and one cannibal cross from the right bank to the left bank:
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]):- % One missionary and one cannibal cross from the right bank to the left bank.
    CL2 is CL+1, % Increase the number of cannibals on the left bank by 1
    ML2 is ML+1, % Increase the number of missionaries on the left bank by 1
    CR2 is CR-1, % Decrease the number of cannibals on the right bank by 1
    MR2 is MR-1, % Decrease the number of missionaries on the right bank by 1
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% One missionary crosses from the right bank to the left bank:
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]):- % One missionary crosses from the right bank to the left bank.
    CL2 is CL, % Cannibals on state 2 is equal to cannibals on state 1
    ML2 is ML+1, % Increase the number of missionaries on the left bank by 1
    CR2 is CL, % Cannibals on state 2 is equal to cannibals on state 1
    MR2 is MR-1, % Decrease the number of missionaries on the right bank by 1
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% One cannibal crosses from the right bank to the left bank:
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]):- % One cannibal crosses from the right bank to the left bank.
    CL2 is CL+1, % Increase the number of cannibals on the left bank by 1
    ML2 is ML, % Missioners on state 2 is equal to missionaries on state 1
    CR2 is CR-1, % Decrease the number of cannibals on the right bank by 1
    MR2 is MR, % Missioners on state 2 is equal to missionaries on state 1
    legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]). % Check if the resulting state is legal

% A state is legal if there are no negative numbers of people, and if there are no more cannibals than missionaries on either bank of the river.
legal_moves([CL,ML,_,CR,MR],[CL2,ML2,_,CR2,MR2]) :-
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

/*
path(InitialState, InitialState, _, []). % Path win when the initial state is equal to the final state
% path(InitialState, FinalState, Visited(no matter), PossibleMoves is empty)

path(InitialState, FinalState, Visited, PossibleMoves):-
    move(InitialState, TempState), % That they are valid moves 
    \+ member(TempState, Visited), % That they arent visited states
    path(TempState, FinalState, [TempState|Visited], Moves), % Recursive call to the path function
    PossibleMoves = [TempState|Moves]. % PossibleMoves is equal to the list of moves

:- path(state(3,3, left), state(0,0, right), [state(3,3, left)], Path), write(Path), nl.
*/

  % 4.1 Recursive formula
path(Ini, Fin, Visited, [move(M, C, Dir)|Path]):- % Path(Initial state, Final state, Visited states, Path)
move(M, C, Dir), % That they are valid moves 
mov(move(M, C, Dir), Ini, Temp), % That they are valid moves from the initial state to the temp state 
\+ not_valid(Temp), % That they arent not valid moves
\+ member(Temp, Visited), % That they arent visited states
path(Temp, Fin, [Temp|Visited], Path). % Recursive call to the path function


/*
path([CL1,ML1,B1,CR1,MR1], % current state
	[CL2,ML2,B2,CR2,MR2], % goal state      
	Explored, % list of explored states (initially containing only the start state)
    MovesList) :- % list of moves (initially empty)
		    move([CL1,ML1,B1,CR1,MR1], [CL3,ML3,B3,CR3,MR3]), % move from the current state to the next state  
		    not(member([CL3,ML3,B3,CR3,MR3], Explored)), % check if the next state is not in the list of explored states (to avoid infinite loops)
		    path([CL3,ML3,B3,CR3,MR3], % recursively call path with the next state as the current state 
			[CL2,ML2,B2,CR2,MR2], % goal state 
			[[CL3,ML3,B3,CR3,MR3]|Explored], % add the next state to the list of explored states
			[ [[CL3,ML3,B3,CR3,MR3], % add the next state to the list of moves 
			[CL1,ML1,B1,CR1,MR1]] | MovesList ]). % recursively call path with the next state as the current state
*/

% recursive call to path
path(InitialState, GoalState, VisitedStates, PossibleMoves) :- 
		    move(InitialState, TemporalState), % move from the current state to the next state  
		    not(member(TemporalState, VisitedStates)), % check if the next state is not in the list of explored states (to avoid infinite loops)
		    path(TemporalState, % recursively call path with the next state as the current state 
			GoalState, % goal state 
			[TemporalState|VisitedStates], % add the next state to the list of explored states
			[ [TemporalState, InitialState] | PossibleMoves ]). % recursively call path with the next state as the current state


path(InitialState, InitialState, _, PossibleMoves):- 
 output(PossibleMoves).
    
output(PossibleMoves) :- write(PossibleMoves). % Print the list of moves if the current state is the goal state (the list of moves is reversed)

:- path(state(3,3, left), state(0,0, right), [state(3,3, left)], Path), write(Path), nl.

/*
% 1. Movements
mov(move(M, C, left), state(ML, CL, right), state(ML2, CL2, left)):- 
    ML2 is ML + M, ML2 >= 0, ML2 =< 3, % ML2 is the number of missionaires in the left side 
    CL2 is CL + C, CL2 >= 0, CL2 =< 3. % CL2 is the number of cannibals in the left side
  
  mov(move(M, C, right), state(ML, CL, left), % move M missionaires and C cannibals to the right
    state(ML2, CL2, right)):-
    ML2 is ML - M, ML2 >= 0, ML2 =< 3, % ML2 is the number of missionaires in the right side
    CL2 is CL - C, CL2 >= 0, CL2 =< 3. % CL2 is the number of cannibals in the right side
  
  % 2. Movements
  move(1,1,_). % move one missionaire and one cannibal
  move(2,0,_). % move two missionaires
  move(0,2,_). % move two cannibals
  move(1,0,_). % move one missionaire
  move(0,1,_). % move one cannibal
  
  % 3. Not valid states
  not_valid(state(2,3, _)). % 2 missionaires and 3 cannibals
  not_valid(state(1,3, _)). % 1 missionaires and 3 cannibals
  not_valid(state(1,2, _)). % 1 missionaires and 2 cannibals
  not_valid(state(2,1, _)). % 2 missionaires and 1 cannibals 
  not_valid(state(1,0, _)). % 1 missionaires and 0 cannibals
  not_valid(state(2,0, _)). % 2 missionaires and 0 cannibals
  */
  
  /*	
  3. Path to the solution
  
  path(+InitialState, +FinalState, +Visited, -Path)
  this is true if Path unify with the listh of
  movements to go from InitialState to FinalState
  witout repeating visited states.
  
  Path = [move(1,0,left), move(1,0, right), ...]
  
  
  Ini  -----------------------> Final
           Path
           
  Ini -> mov -> Aux
                ------------> Final
                     Path
                     N-1
  */
  
  /*
  % 4. Path to the solution
  path(Ini, Ini, _, []). % path win when the initial state is equal to the final state
  
  % 4.1 Recursive formula
  path(Ini, Fin, Visited, [move(M, C, Dir)|Path]):- % Path(Initial state, Final state, Visited states, Path)
    move(M, C, Dir), % That they are valid moves 
    mov(move(M, C, Dir), Ini, Temp), % That they are valid moves from the initial state to the temp state 
    \+ not_valid(Temp), % That they arent not valid moves
    \+ member(Temp, Visited), % That they arent visited states
    path(Temp, Fin, [Temp|Visited], Path). % Recursive call to the path function
  
  :- path(state(3,3, left), state(0,0, right), [state(3,3, left)], Path), write(Path), nl.
  % Path( Initial state,    Final state,        Visited states,   Path), write(Path), nl, fail.
  % the fail is to continue searching for more paths to the solution 
  % if we remove the fail, the program will stop after finding the first path to the solution
*/
