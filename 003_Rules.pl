% consult('003_Rules.pl').

% Rules are used when you want to say that a fact depends on a group of facts
% NOTE : You'll get the discontiguous predicate warning if you
% don't keep your predicates together

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).
 
% We can define the Fact that when Bob is happy he runs 
% :- stands for if
% albert runs if he is happy

runs(albert) :- happy(albert).

% runs(albert). = yes 
% We can check if 2 conditions are true by putting a comma (and)

% between questions (CONJUCTIONS) 
% alice dances when she is happy and with_albert

dances(alice) :-
  happy(alice),
  with_albert(alice).
 
% We can define predicates to keep commands brief

does_alice_dance :- dances(alice),
       write('When Alice is happy and with Albert she dances').

% Just type does_alice_dance. in the terminal
% Both rules must be true to get a yes result

% AND (CONJUNCTION) 
swims(bob) :-
  happy(bob),
  near_water(bob).
% swims(bob). = error
% We can create 2 instances and if either comes back true the result
% will be yes
 
% OR (DISJUNCTION)
% We can use OR by using a semicolon (;) to separate the rules
swims(bill) :-
  happy(bill) ;
  near_water(bill).
% swims(bill). = yes