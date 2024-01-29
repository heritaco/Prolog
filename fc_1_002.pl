% Define the initial state (3 missionaries, 3 cannibals on the left bank, boat on the left bank, 0 missionaries, 0 cannibals on the right bank)
initial_state([3,3,l,0,0]).

% Define the goal state (0 missionaries, 0 cannibals on the left bank, boat on the right bank, 3 missionaries, 3 cannibals on the right bank)
goal_state([0,0,r,3,3]).

% Define the valid states (no more cannibals than missionaries on either bank)
valid([ML,CL,_,MR,CR]) :- 
    (ML >= CL ; ML == 0), 
    (MR >= CR ; MR == 0).

% Define the possible moves
move([ML,CL,l,MR,CR], [ML,CL2,r,MR,CR2]) :- 
    CL2 is CL - 2, CR2 is CR + 2, valid([ML,CL2,r,MR,CR2]). % Two cannibals cross from left to right
move([ML,CL,l,MR,CR], [ML2,CL,r,MR2,CR]) :- 
    ML2 is ML - 2, MR2 is MR + 2, valid([ML2,CL,r,MR2,CR]). % Two missionaries cross from left to right
move([ML,CL,l,MR,CR], [ML2,CL2,r,MR2,CR2]) :- 
    ML2 is ML - 1, CL2 is CL - 1, MR2 is MR + 1, CR2 is CR + 1, valid([ML2,CL2,r,MR2,CR2]). % One missionary and one cannibal cross from left to right
move([ML,CL,r,MR,CR], [ML,CL2,l,MR,CR2]) :- 
    CL2 is CL + 2, CR2 is CR - 2, valid([ML,CL2,l,MR,CR2]). % Two cannibals cross from right to left
move([ML,CL,r,MR,CR], [ML2,CL,l,MR2,CR]) :- 
    ML2 is ML + 2, MR2 is MR - 2, valid([ML2,CL,l,MR2,CR]). % Two missionaries cross from right to left
move([ML,CL,r,MR,CR], [ML2,CL2,l,MR2,CR2]) :- 
    ML2 is ML + 1, CL2 is CL + 1, MR2 is MR - 1, CR2 is CR - 1, valid([ML2,CL2,l,MR2,CR2]). % One missionary and one cannibal cross from right to left

% Define the depth-first search
dfs(Path, [Node|Path]) :- 
    goal_state(Node).
dfs(Path, Solution) :- 
    move(Node, Child), 
    not(member(Child, Path)), 
    dfs([Child|Path], Solution).

% Define the main predicate
main :- 
    initial_state(Initial), 
    dfs([Initial], Solution), 
    reverse(Solution, CorrectOrder), 
    write(CorrectOrder), nl.