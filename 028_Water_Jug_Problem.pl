% consult('Water_Jug_Problem').pl

    /*
    We have a 3-liter jug, a 5-liter jug, and an unlimited supply of water. 
    Goal: to get exactly 1 liter of water into either jug. 
    Either jug can be emptied or filled, or poured into the other. 
    A state in this problem could be represented with just a pair of numbers, 
    the first representing the number of liters of water in the 5-liter (large) jug, 
    and the second representing the number of liters of water in the 3-liter (small) jug.
    */

% facts
initial([0,0]).
final([0,1];[1,0]). % final state is either [0,1] or [1,0]

% rules
fill_5([_,X],[5,X]). % fill the 5 liter jug
fill_3([X,_],[X,3]). % fill the 3 liter jug
empty_5([_,X],[0,X]). % empty the 5 liter jug
empty_3([X,_],[X,0]). % empty the 3 liter jug 
pour_3_into_5([X,Y],[X2,Y2]) :- X2 is X + Y,  X2 =< 5, Y2 is 5 - X. % pour water from the 3 liter jug into the 5 liter jug until its capacity is reached
pour_5_into_3([X,Y],[X2,Y2]) :- Y2 is X + Y,  Y2 =< 3, X2 is 3 - Y. % pour water from the 5 liter jug into the 3 liter jug until its capacity is reached
pour_3_into_5([X,Y],[X2,Y2]) :- X2 is X + Y, X2 =< 5, Y2 is 0. % pour water from the 3 liter jug into the 5 liter jug until the 3 liter jug is empty
pour_5_into_3([X,Y],[X2,Y2]) :- Y2 is X + Y, Y2 =< 3, X2 is 0. % pour water from the 5 liter jug into the 3 liter jug until the 5 liter jug is empty