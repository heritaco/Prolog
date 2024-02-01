% 1. Movements
mov(move(C, M, left), state(CL, ML, right), state(CL2, ML2, left)):- 
    ML2 is ML + M, ML2 >= 0, ML2 =< 3, % ML2 is the number of missionaires in the left side 
    CL2 is CL + C, CL2 >= 0, CL2 =< 3. % CL2 is the number of cannibals in the left side
  
  mov(move(C, M, right), state(CL, ML, left), state(CL2, ML2, right)):-
    ML2 is ML - M, ML2 >= 0, ML2 =< 3, % ML2 is the number of missionaires in the right side
    CL2 is CL - C, CL2 >= 0, CL2 =< 3. % CL2 is the number of cannibals in the right side
  
  % 2. Movements
  move(2,0,_). % move two cannibals
  move(0,2,_). % move two missionaires
  move(1,0,_). % move one cannibal
  move(0,1,_). % move one missionaire
  move(1,1,_). % move one 
  
  
  move(move(C, M, _, C2, M2), state(CL, ML, left, CR, MR), state(CL2, ML2, left, CR2, MR2)):- % move(C, M, _, C2, M2) is the movement of the cannibals and missionaires
    ML2 is ML - M, ML2 >= 0, ML2 =< 3, % ML2 is the number of missionaires in the left side
    CL2 is CL - C, CL2 >= 0, CL2 =< 3, % CL2 is the number of cannibals in the left side
    MR2 is MR + M2, MR2 >= 0, MR2 =< 3, % MR2 is the number of missionaires in the right side
    CR2 is CR + C2, CR2 >= 0, CR2 =< 3. % CR2 is the number of cannibals in the right side
  
  
  % Two missionaries cross from the left bank to the right bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % Two missionaries cross from the left bank to the right bank.
      CL2 is CL,   % Cannibals on state 2 is equal to cannibals on state 1
      ML2 is ML-2,  % Decrease the number of missionaries on the left bank by 2
      CR2 is CR, % Cannibals on state 2 is equal to cannibals on state 1
      MR2 is MR+2,  % Increase the number of missionaries on the right bank by 2
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % Two cannibals cross from the left bank to the right bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % Two cannibals cross from the left bank to the right bank.
      CL2 is CL-2, % Decrease the number of cannibals on the left bank by 2
      ML2 is ML, % Missioners on state 2 is equal to missionaries on state 1
      CR2 is CR+2, % Increase the number of cannibals on the right bank by 2
      MR2 is MR, % Missioners on state 2 is equal to missionaries on state 1
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % One missionary and one cannibal cross from the left bank to the right bank.
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):-
      CL2 is CL-1, % Decrease the number of cannibals on the left bank by 1
      ML2 is ML-1, % Decrease the number of missionaries on the left bank by 1
      CR2 is CR+1, % Increase the number of cannibals on the right bank by 1
      MR2 is MR+1, % Increase the number of missionaries on the right bank by 1
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % One missionary crosses from the left bank to the right bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % One missionary crosses from the left bank to the right bank.
      CL2 is CL, % Cannibals on state 2 is equal to cannibals on state 1
      ML2 is ML-1, % Decrease the number of missionaries on the left bank by 1
      CR2 is CR, % Cannibals on state 2 is equal to cannibals on state 1
      MR2 is MR+1, % Increase the number of missionaries on the right bank by 1
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % One cannibal crosses from the left bank to the right bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % One cannibal crosses from the left bank to the right bank.
      CL2 is CL-1, % Decrease the number of cannibals on the left bank by 1
      ML2 is ML, % Missioners on state 2 is equal to missionaries on state 1
      CR2 is CR+1, % Increase the number of cannibals on the right bank by 1
      MR2 is MR, % Missioners on state 2 is equal to missionaries on state 1
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % Two missionaries cross from the right bank to the left bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % Two missionaries cross from the right bank to the left bank.
      CL2 is CL, % Cannibals on state 2 is equal to cannibals on state 1
      ML2 is ML+2, % Increase the number of missionaries on the left bank by 2
      CR2 is CR, % Cannibals on state 2 is equal to cannibals on state 1
      MR2 is MR-2, % Decrease the number of missionaries on the right bank by 2
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % Two cannibals cross from the right bank to the left bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % Two cannibals cross from the right bank to the left bank.
      CL2 is CL+2, % Increase the number of cannibals on the left bank by 2
      ML2 is ML, % Missioners on state 2 is equal to missionaries on state 1
      CR2 is CR-2, % Decrease the number of cannibals on the right bank by 2
      MR2 is MR, % Missioners on state 2 is equal to missionaries on state 1
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % One missionary and one cannibal cross from the right bank to the left bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % One missionary and one cannibal cross from the right bank to the left bank.
      CL2 is CL+1, % Increase the number of cannibals on the left bank by 1
      ML2 is ML+1, % Increase the number of missionaries on the left bank by 1
      CR2 is CR-1, % Decrease the number of cannibals on the right bank by 1
      MR2 is MR-1, % Decrease the number of missionaries on the right bank by 1
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % One missionary crosses from the right bank to the left bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % One missionary crosses from the right bank to the left bank.
      CL2 is CL, % Cannibals on state 2 is equal to cannibals on state 1
      ML2 is ML+1, % Increase the number of missionaries on the left bank by 1
      CR2 is CL, % Cannibals on state 2 is equal to cannibals on state 1
      MR2 is MR-1, % Decrease the number of missionaries on the right bank by 1
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % One cannibal crosses from the right bank to the left bank:
  move(state1(CL,ML,left,CR,MR),state2(CL2,ML2,right,CR2,MR2)):- % One cannibal crosses from the right bank to the left bank.
      CL2 is CL+1, % Increase the number of cannibals on the left bank by 1
      ML2 is ML, % Missioners on state 2 is equal to missionaries on state 1
      CR2 is CR-1, % Decrease the number of cannibals on the right bank by 1
      MR2 is MR, % Missioners on state 2 is equal to missionaries on state 1
      legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)). % Check if the resulting state is legal
  
  % A state is legal if there are no negative numbers of people, and if there are no more cannibals than missionaries on either bank of the river.
  legal_moves(state1(CL,ML,_,CR,MR),state2(CL2,ML2,_,CR2,MR2)) :-
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
  
  
  % 3. Not valid states
  not_valid(state(2,3, _)). % 2 missionaires and 3 cannibals
  not_valid(state(1,3, _)). % 1 missionaires and 3 cannibals
  not_valid(state(1,2, _)). % 1 missionaires and 2 cannibals
  not_valid(state(2,1, _)). % 2 missionaires and 1 cannibals 
  not_valid(state(1,0, _)). % 1 missionaires and 0 cannibals
  not_valid(state(2,0, _)). % 2 missionaires and 0 cannibals
  
  % 4. Path to the solution
  path(InitialState, InitialState, _, []). % path win when the initial state is equal to the final state
  
  % 4.1 Recursive formula
  path(InitialState, FinalState, VisitedStates, [move(C, M, Direction)|Path]):- % Path(Initial state, Final state, Visited states, Path)
    move(C, M, Direction), % That they are valid moves 
    mov(move(C, M, Direction), InitialState, TemporalState), % That they are valid moves from the initial state to the temp state 
    \+ not_valid(TemporalState), % That they arent not valid moves
    \+ member(TemporalState, VisitedStates), % That they arent visited states
    path(TemporalState, FinalState, [TemporalState|VisitedStates], Path). % Recursive call to the path function
  
  :- path(state(3,3, left), state(0,0, right), [state(3,3, left)], Path), write(Path), nl.
  % Path( Initial state,    Final state,        Visited states,   Path), write(Path), nl, fail.
  % the fail is to continue searching for more paths to the solution 
  % if we remove the fail, the program will stop after finding the first path to the solution