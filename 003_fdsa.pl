% The start state of the problem, where 3 cannibals and 3 missionaries are on the left bank of the river, and the boat is also on the left bank.
start([3,3,boatlr,0,0]).

% The goal state of the problem, where all 3 cannibals and 3 missionaries have moved to the right bank of the river, and the boat is also on the right bank.
finish([0,0,boatrl,3,3]).

% A state is legal if there are no negative numbers of people, and if there are no more cannibals than missionaries on either bank of the river.
legal(CL,ML,boat,CR,MR) :-
    ML>=0, % Check if missionaries on left bank is greater than or equal to 0
	CL>=0, % Check if cannibals on left bank is greater than or equal to 0
	MR>=0, % Check if missionaries on right bank is greater than or equal to 0
	CR>=0, %  Check if cannibals on right bank is greater than or equal to 0
    (ML>=CL ; ML=0), % Check if there are no more cannibals than missionaries on the left bank or if there are no missionaries on the left bank
    (MR>=CR ; MR=0). % Check if there are no more cannibals than missionaries on the right bank or if there are no missionaries on the right bank

% Define the possible moves:

% Two missionaries cross from the left bank to the right bank.
move([CL,ML,left,CR,MR],[CL,ML2,right,CR,MR2]):-
    MR2 is MR+2,  % Increase the number of missionaries on the right bank by 2
    ML2 is ML-2,  % Decrease the number of missionaries on the left bank by 2
    legal(CL,ML2,boat,CR,MR2).  % Corrected here

% Two cannibals cross from the left bank to the right bank.
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR]):-
    CR2 is CR+2, % Increase the number of cannibals on the right bank by 2
    CL2 is CL-2, % Decrease the number of cannibals on the left bank by 2
    legal(CL2,ML,boat,CR2,MR). % Check if the resulting state is legal

% One missionary and one cannibal cross from the left bank to the right bank.
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]):-
    CR2 is CR+1, % Increase the number of cannibals on the right bank by 1
    CL2 is CL-1, % Decrease the number of cannibals on the left bank by 1
    MR2 is MR+1, % Increase the number of missionaries on the right bank by 1
    ML2 is ML-1, % Decrease the number of missionaries on the left bank by 1
    legal(CL2,ML2,boat,CR2,MR2). % Check if the resulting state is legal

% One missionary crosses from the left bank to the right bank.
move([CL,ML,left,CR,MR],[CL,ML2,right,CR,MR2]):- 
    MR2 is MR+1, % Increase the number of missionaries on the right bank by 1
    ML2 is ML-1, % Decrease the number of missionaries on the left bank by 1
    legal(CL,ML2,boat,CR,MR2). % Check if the resulting state is legal

% One cannibal crosses from the left bank to the right bank.
move([CL,ML,left,CR,MR],[CL2,ML,right,CR2,MR]):-
    CR2 is CR+1, % Increase the number of cannibals on the right bank by 1
    CL2 is CL-1, % Decrease the number of cannibals on the left bank by 1
    legal(CL2,ML,boat,CR2,MR). % Check if the resulting state is legal

% Two missionaries cross from the right bank to the left bank.
move([CL,ML,right,CR,MR],[CL,ML2,left,CR,MR2]):-
    MR2 is MR-2, % Decrease the number of missionaries on the right bank by 2
    ML2 is ML+2, % Increase the number of missionaries on the left bank by 2
    legal(CL,ML2,boat,CR,MR2). % Check if the resulting state is legal

% Two cannibals cross from the right bank to the left bank.
move([CL,ML,right,CR,MR],[CL2,ML,left,CR2,MR]):-
    CR2 is CR-2, % Decrease the number of cannibals on the right bank by 2
    CL2 is CL+2, % Increase the number of cannibals on the left bank by 2
    legal(CL2,ML,BOAT,CR2,MR). % Check if the resulting state is legal

% One missionary and one cannibal cross from the right bank to the left bank.
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]):-
    CR2 is CR-1, % Decrease the number of cannibals on the right bank by 1
    CL2 is CL+1, % Increase the number of cannibals on the left bank by 1
    MR2 is MR-1, % Decrease the number of missionaries on the right bank by 1
    ML2 is ML+1, % Increase the number of missionaries on the left bank by 1
    legal(CL2,ML2,BOAT,CR2,MR2). % Check if the resulting state is legal

% One missionary crosses from the right bank to the left bank.
move([CL,ML,right,CR,MR],[CL,ML2,left,CR,MR2]):-
    MR2 is MR-1, % Decrease the number of missionaries on the right bank by 1
    ML2 is ML+1, % Increase the number of missionaries on the left bank by 1
    legal(CL,ML2,BOAT,CR,MR2). % Check if the resulting state is legal

% One cannibal crosses from the right bank to the left bank.
move([CL,ML,right,CR,MR],[CL2,ML,left,CR2,MR]):-
    CR2 is CR-1, % Decrease the number of cannibals on the right bank by 1
    CL2 is CL+1, % Increase the number of cannibals on the left bank by 1
    legal(CL2,ML,BOAT,CR2,MR). % Check if the resulting state is legal

% apelul recursiv
path([CL1,ML1,B1,CR1,MR1], % current state 
	[CL2,ML2,B2,CR2,MR2], % goal state      
	Explored,MovesList) :- % list of explored states and list of moves (initially empty) 
		    move([CL1,ML1,B1,CR1,MR1], % move from the current state to the next state 
			[CL3,ML3,B3,CR3,MR3]), % move from the current state to the next state  
		    not(member([CL3,ML3,B3,CR3,MR3],Explored)), % check if the next state has not been explored yet (to avoid infinite loops) 
		    path([CL3,ML3,B3,CR3,MR3], % recursively call path with the next state as the current state 
			[CL2,ML2,B2,CR2,MR2], % goal state 
			[[CL3,ML3,B3,CR3,MR3]|Explored], % add the next state to the list of explored states
			[ [[CL3,ML3,B3,CR3,MR3], % add the next state to the list of moves 
			[CL1,ML1,B1,CR1,MR1]] | MovesList ]). % recursively call path with the next state as the current state


path([CL,ML,B,CR,MR], % current state 
    [CL,ML,B,CR,MR], % goal state 
    _, % list of explored states (not needed here) 
    MovesList):- % list of moves (initially empty) 
	        output(MovesList). % print the list of moves if the current state is the goal state (the list of moves is reversed) 


describe_move([CL1,ML1,_,CR1,MR1], [CL2,ML2,_,CR2,MR2]) :-
    DeltaC is CL1 - CL2,
    DeltaM is ML1 - ML2,
    (DeltaC > 0 -> format('~w cannibals from left to right, ', [-DeltaC]) ; true),
    (DeltaM > 0 -> format('~w missionaries from left to right, ', [-DeltaM]) ; true),
    (DeltaC < 0 -> format('~w cannibals from right to left, ', [DeltaC]) ; true),
    (DeltaM < 0 -> format('~w missionaries from right to left, ', [DeltaM]) ; true),
    nl.
            
output([]) :- nl.
            
output([[A,B]|MovesList]) :-
    output(MovesList),
    describe_move(B, A).

find :-
   path([3,3,left,0,0],[0,0,right,3,3],[[3,3,left,0,0]],_). % call path with the start state, the goal state, and the list of explored states (initially containing only the start state)