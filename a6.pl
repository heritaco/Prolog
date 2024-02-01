% 1. Movements
move(valid_move(C, M, left), state(CL, ML, right), state(CL2, ML2, left)):- 
    ML2 is ML + M, ML2 >= 0, ML2 =< 3, % ML2 is the number of missionaires in the left side 
    CL2 is CL + C, CL2 >= 0, CL2 =< 3. % CL2 is the number of cannibals in the left side
  
  move(valid_move(C, M, right), state(CL, ML, left), state(CL2, ML2, right)):-
    ML2 is ML - M, ML2 >= 0, ML2 =< 3, % ML2 is the number of missionaires in the right side
    CL2 is CL - C, CL2 >= 0, CL2 =< 3. % CL2 is the number of cannibals in the right side
  
mov(oneMisLeft, state(ML, CL, right), state(ML2, CL)):-
   MR is 3 - ML,
   MR > 0,
   ML2 is ML + 1. 

state(ML, CL, Boat, MR, CR).

% 2. Valid moves

movement(state(ML, CL, right, MR, CR), state(ML2, CL, left, MR1, CR1)):-
  
  % 4. Path to the solution
  path(InitialState, InitialState, _, []). % path win when the initial state is equal to the final state
  
  % 4.1 Recursive formula
  path(InitialState, FinalState, VisitedStates, [move(C, M, Direction)|Path]):- % Path(Initial state, Final state, Visited states, Path)
  valid_move(C, M, Direction), % That they are valid moves 
    move(valid_move(C, M, Direction), InitialState, TemporalState), % That they are valid moves from the initial state to the temp state 
    \+ not_valid(TemporalState), % That they arent not valid moves
    \+ member(TemporalState, VisitedStates), % That they arent visited states
    path(TemporalState, FinalState, [TemporalState|VisitedStates], Path). % Recursive call to the path function
  
  :- path(state(3,3, left), state(0,0, right), [state(3,3, left)], Path), write(Path), nl.
  