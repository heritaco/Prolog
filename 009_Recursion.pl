% consult('009_Recursion.pl').  
 
/*
parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).
 
parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).
 
parent(bob, carl).
parent(bob, charlie).
*/
 
% Works for exact matches
 
related(X, Y) :- parent(X, Y).
% related(albert, bob). = true
 
 
% Cycles through possible results until related returns a true
 
related(X, Y) :-
  parent(X, Z),
  related(Z, Y).
 
% related(albert,carl). = true
 
 
% 1. parent(albert, Z). = true = Z = bob, betsy, bill
 
% 2. related(Z, carl). = true when Z = bob
 