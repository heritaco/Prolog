# This code is a solution to the cannibals and missionaries puzzle.
# It aims to help you understand how to solve the puzzle using SWI-Prolog.
# Each line of the code is commented to provide a clear explanation of its purpose.

% Define the initial state of the puzzle
initial_state(state(3, 3, left)).

% Define the goal state of the puzzle
goal_state(state(0, 0, right)).

% Define the valid moves that can be made
valid_move(state(CL, ML, left), state(CL, MLN, right)) :-
    MLN is ML + 1,
    MLN >= 0,
    MLN =< 3.
valid_move(state(CL, ML, left), state(CLN, ML, right)) :-
    CLN is CL + 1,
    CLN >= 0,
    CLN =< 3.
valid_move(state(CL, ML, right), state(CL, MLN, left)) :-
    MLN is ML + 1,
    MLN >= 0,
    MLN =< 3.
valid_move(state(CL, ML, right), state(CLN, ML, left)) :-
    CLN is CL + 1,
    CLN >= 0,
    CLN =< 3.
valid_move(state(CL, ML, left), state(CLN, MLN, right)) :-
    CLN is CL + 1,
    MLN is ML + 1,
    CLN >= 0,
    CLN =< 3,
    MLN >= 0,
    MLN =< 3.

% Define the recursive predicate to solve the puzzle
solve(State, []) :-
    goal_state(State).
solve(State, [Move | Moves]) :-
    valid_move(State, NextState),
    solve(NextState, Moves),
    Move = move(State, NextState).

% Query to solve the puzzle and get the solution
?- initial_state(InitialState),
   solve(InitialState, Solution).
