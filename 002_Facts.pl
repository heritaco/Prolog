% consult('002_Facts.pl').

% Write the relationship first followed by the objects between
% parenthese followed by a dot
 
% albert, male, female are atom constants that must begin with a
% lowercase letter unless they are between single quotes
% An atom can contain letters, numbers, +, -, _, *, /, <, >, :, ., ~, &
% AN ATOM CANNOT START WITH _
 
% The name before parenthese is called the predicate
% The names in parenthese are called arguments
% predicate(arguments)
 
male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).
 
female(alice).
female(betsy).
female(diana).
 
% We can find out if alice is a woman with
% female(alice). = yes
% listing(male). = list all clauses defining the predicate male
 
% male(X), female(Y). = Show all combinations of male and female
% se hace como un producto cartesiano
% TENEMOS QUE PONER ; PARA QUE NOS DE TODAS LAS COMBINACIONES