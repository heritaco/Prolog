% consult('012_Changing_The_DB.pl').

% Any predicate you plan to motify should be marked as dynamic before
 
% this predicate is used in any way
 
:- dynamic(father/2).
:- dynamic(likes/2).
:- dynamic(friend/2).
:- dynamic(stabs/3).
 
father(lord_montague,romeo).
father(lord_capulet,juliet).
 
likes(mercutio,dancing).
likes(benvolio,dancing).
likes(romeo,dancing).
likes(romeo,juliet).
likes(juliet,romeo).
likes(juliet,dancing).
 
friend(romeo,mercutio).
friend(romeo,benvolio).
% friend(X, romeo) :- friend(romeo, X).
 
 
stabs(tybalt,mercutio,sword).
stabs(romeo,tybalt,sword).
 
% Add new clause to the database at the end of the list for the same
 
% predicate
 
% assertz(friend(benvolio, mercutio)).
 
% friend(benvolio, mercutio). = yes
 
 
% Add clause at the start of the predicate list
 
% asserta(friend(mercutio, benvolio)).
 
% friend(mercutio, benvolio). = yes
 
 
% Delete a clause
 
% retract(likes(mercutio,dancing)).
 
% likes(mercutio,dancing). = no
 
 
% Delete all clauses that match
 
% retractall(father(_,_)).
 
% father(lord_montague,romeo). = no
 
 
% Delete all matching clauses
 
% retractall(likes(_,dancing)).
 
% likes(_,dancing). = no