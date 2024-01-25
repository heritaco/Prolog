% consult('001_Introduction.pl').

% write prints text between quotes to the screen
% nl stands for new line and \'s allows you to use quotes 
% T write('Hello World'),nl,write('Let\'s Program').
 
% This is a fact where loves is a predicate and romeo and
% juliet are atoms (constants) and loves arguments
 
loves(romeo, juliet).
 
% This is a rule where :- (if) says if the item on the right is
% true, then so is the item on the left
 
loves(juliet, romeo) :- loves(romeo, juliet).
 
% Evaluating whether the goal was met in the terminal

% loves(juliet, romeo). = yes
 
% Facts and Rules are called clauses

% A Variable is an object we cant name at the time of execution 
% Variables are uppercase while atoms are lowercase

% loves(romeo, X). = X = juliet
