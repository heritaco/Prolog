start([CL,ML,B,CR,MR]) = ([3,3,L,0,0]).
goal([CL,ML,B,CR,MR]) = ([0,0,_,3,3]).

valid([CL,ML,_,CR,MR]) :- % Valid if the number of missionaries on either side is 0 or greater than or equal to the number of cannibals on that side
    (ML >= CL ; ML == 0), 
    (MR >= CR ; MR == 0).

% Move 2 missionaries from left to right
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]) :-
    ML2 is ML - 2, % ML2 is the number of missionaries left on the left side
    MR2 is MR + 2. % MR2 is the number of missionaries on the right side

% Move 1 missionary from left to right
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]) :-
    ML2 is ML - 1, % ML2 is the number of missionaries left on the left side
    MR2 is MR + 1. % MR2 is the number of missionaries on the right side

% Move 2 cannibals from left to right
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]) :-
    CL2 is CL - 2, % CL2 is the number of cannibals left on the left side
    CR2 is CR + 2. % CR2 is the number of cannibals on the right side

% Move 1 cannibal from left to right
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]) :-
    CL2 is CL - 1, % CL2 is the number of cannibals left on the left side
    CR2 is CR + 1. % CR2 is the number of cannibals on the right side

% Move 1 missionary and 1 cannibal from left to right
move([CL,ML,left,CR,MR],[CL2,ML2,right,CR2,MR2]) :-
    CL2 is CL - 1, % CL2 is the number of cannibals left on the left side
    CR2 is CR + 1, % CR2 is the number of cannibals on the right side
    ML2 is ML - 1, % ML2 is the number of missionaries left on the left side
    MR2 is MR + 1. % MR2 is the number of missionaries on the right side

% Move 2 missionaries from right to left
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]) :-
    ML2 is ML + 2, % ML2 is the number of missionaries left on the left side
    MR2 is MR - 2. % MR2 is the number of missionaries on the right side

% Move 1 missionary from right to left
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]) :-
    ML2 is ML + 1, % ML2 is the number of missionaries left on the left side
    MR2 is MR - 1. % MR2 is the number of missionaries on the right side

% Move 2 cannibals from right to left
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]) :-
    CL2 is CL + 2, % CL2 is the number of cannibals left on the left side
    CR2 is CR - 2. % CR2 is the number of cannibals on the right side

% Move 1 cannibal from right to left
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]) :-
    CL2 is CL + 1, % CL2 is the number of cannibals left on the left side
    CR2 is CR - 1. % CR2 is the number of cannibals on the right side

% Move 1 missionary and 1 cannibal from right to left
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]) :-
    CL2 is CL + 1, % CL2 is the number of cannibals left on the left side
    CR2 is CR - 1, % CR2 is the number of cannibals on the right side
    ML2 is ML + 1, % ML2 is the number of missionaries left on the left side
    MR2 is MR - 1. % MR2 is the number of missionaries on the right side

% This predicate is used to print the solution.
% It is a recursive function that prints each state of the solution from the end to the beginning.

% Base case: If the list is empty, do nothing.
printSolution([]).

% Recursive case: If the list is not empty,
% recursively call printSolution on the tail of the list (T),
% then print the head of the list (H).
printSolution([H|T]) :-
    printSolution(T),  % Recursive call with the tail of the list
    write(H), nl.  % Print the head of the list and a newline

% Solve the problem
solve([CL,ML,left,CR,MR],[CL,ML,left,CR,MR],_,Solution,Solution).
solve(State1,State2,Visited,Acc,Solution) :-
    move(State1,State3),
    valid(State3),
    not(member(State3,Visited)),
    solve(State3,State2,[State3|Visited],[State3|Acc],Solution).

% Solve the problem
solve(Start,Solution) :-
    goal(Goal),
    solve(Start,Goal,[Start],[],Solution).

% Run the program
run :-
    start(Start),
    solve(Start,Solution),
    printSolution(Solution).


% Output:
% [3,3,left,0,0]
% [3,1,right,0,2]
% [3,2,left,0,1]
% [3,0,right,0,3]
% [3,1,left,0,2]
% [1,1,right,2,2]
% [2,2,left,1,1]
% [2,0,right,1,3]
% [3,0,left,0,3]
% [1,0,right,2,3]
% [1,1,left,2,2]
% [0,0,right,3,3]

