% Rules:

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


% recursive call to path
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


path(InitialState, % current state 
    InitialState, % goal state 
    _, % list of explored states (not needed here) 
    MovesList):- % list of moves (initially empty) 
	        output(MovesList). % print the list of moves if the current state is the goal state (the list of moves is reversed) 


describe_move([CL1,ML1,_,CR1,MR1], [CL2,ML2,_,CR2,MR2]) :- % describe the move from the current state to the next state
    CCL is CL1 - CL2, % compute the difference between the number of cannibals on the left bank of the river in the current state and the next state
    MML is ML1 - ML2, % compute the difference between the number of missionaries on the left bank of the river in the current state and the next state
    Cannibalss is abs(CCL), % compute the absolute value 
    Missionerss is abs(MML), % compute the absolute value 
    (CCL > 0 -> format('move ~w cannibals from left to right, ', [Cannibalss]) ; true), % print the number of cannibals moved from the left bank to the right bank if the number of cannibals moved from the left bank to the right bank is greater than 0
    (MML > 0 -> format('move ~w missionaries from left to right, ', [Missionerss]) ; true), % print the number of missionaries moved from the left bank to the right bank if the number of missionaries moved from the left bank to the right bank is greater than 0
    (CCL < 0 -> format('move ~w cannibals from right to left, ', [Cannibalss]) ; true), % print the number of cannibals moved from the right bank to the left bank if the number of cannibals moved from the right bank to the left bank is greater than 0
    (MML < 0 -> format('move ~w missionaries from right to left, ', [Missionerss]) ; true), % print the number of missionaries moved from the right bank to the left bank if the number of missionaries moved from the right bank to the left bank is greater than 0
    nl. % print a new line
            
output([]) :- write('c:'),nl . % print a new line if the list of moves is empty
            
output([[A,B]|MovesList]) :- % print the list of moves
    output(MovesList), % recursively call output with the tail of the list of moves
    describe_move(B, A). % describe the move from the current state to the next state

 :- path([3,3,left,0,0],[0,0,right,3,3],[3,3,left,0,0],_). % call path with the start state, the goal state, and the list of explored states (initially containing only the start state), list of mobves (initially empty)