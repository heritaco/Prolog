% 1. Movements

% move is the functino
% valid_move is the function that will give us the valid moves view point 2
% state is the function that will give us the first state and the final state

% move from left to right
move(valid_move(CM, MM, right), state(CL1, ML1, left), state(CL2, ML2, right)):-
    ML2 is ML1 - MM, % ML2 is the number of missionaires in the right side, ML is the number of missionaires in the left side, MM is the number of missionaires that we want to move
    ML2 >= 0, % ML2 is greater or equal to 0
    ML2 =< 3, % ML2 is less or equal to 3
    CL2 is CL1 - CM, % CL2 is the number of cannibals in the right side, CL is the number of cannibals in the left side, CM is the number of cannibals that we want to move
    CL2 >= 0, 
    CL2 =< 3. % CL2 is the number of cannibals in the right side
  
  % move from right to left
  move(valid_move(CM, MM, left), state(CL1, ML1, right), state(CL2, ML2, left)):- 
      ML2 is ML1 + MM, % ML2 is the number of missionaires in the left side 
      ML2 >= 0, % ML2 is greater or equal to 0
      ML2 =< 3, % ML2 is the number of missionaires in the left side 
      CL2 is CL1+ CM, % CL2 is the number of cannibals in the left side
      CL2 >= 0, % CL2 is greater or equal to 0
      CL2 =< 3. % CL2 is the number of cannibals in the left side
    
  % 2. Valid moves
  valid_move(2,0,_). % move two cannibals
  valid_move(0,2,_). % move two missionaires
  valid_move(1,0,_). % move one cannibal
  valid_move(0,1,_). % move one missionaire
  valid_move(1,1,_). % move one missionaire and one cannibal
    
  % 3. Not valid states
  not_valid(state(3,2, _)). % 3 cannibals and 2 missionaires
  not_valid(state(3,1, _)). % 3 cannibals and 1 missionaires
  not_valid(state(2,1, _)). % 2 cannibals and 1 missionaires
  not_valid(state(1,2, _)). % 1 cannibal and 2 missionaires, because the 2 cannibals will eat the missionair
  not_valid(state(0,1, _)). % 0 cannibals and 1 missionaires, because the 3 cannibals will eat the 2 missionair
  not_valid(state(0,2, _)). % 0 cannibals and 2 missionaires, because the 3 cannibals will eat the missionair
    
  % 4. Path to the solution
  path(InitialState, InitialState, _, []). % path win when the initial state is equal to the final state
  %path(InitialState, FinalState, VisitedStates, [move(C, M, Direction)|Path])
  % InitialState is the initial state
  % FinalState is the initial state, meaning that we won
  % VisitedStates is the list of visited states
  % [move(C, M, Direction)|Path] is the list of movements that we need to do to get to the final state, we won we dont need to do any movement
  
  % 4.1 Recursive formula
  path(InitialState, FinalState, VisitedStates, [move(Cannibal, Missioner, Direction)|Path]):- % Path(Initial state, Final state, Visited states, Path)
    % move(C, M, Direction) is the movement that we need to do to get to the final state, it is a list of movements that we need to do to get to the final state
    % Path is the list of movements that we need to do to get to the final state
    valid_move(Cannibal, Missioner, Direction), % That they are only valid moves 
    move(valid_move(Cannibal, Missioner, Direction), InitialState, TemporalState), % That they are valid moves from the initial state to the temp state 
    \+ not_valid(TemporalState), % That they arent not valid moves
    \+ member(TemporalState, VisitedStates), % That they arent visited states in the list of temporal states
    path(TemporalState, FinalState, [TemporalState|VisitedStates], Path). % Recursive call to the path function
    
  solve:- path(state(3,3, left), state(0,0, right), [state(3,3, left)], Path), write(Path), nl.
  % path is the function that will give us the solution to the problem
  % state(3,3, left) is the initial state
  % state(0,0, right) is the final state
  % [state(3,3, left)] is the list of visited states (initial state)
  % Path is the list of movements that we need to do to get to the final state
  % write(Path) is the function that will print the solution
  % nl is the function that will print a new line