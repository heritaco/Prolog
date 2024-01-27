% consult('007_Comparison.pl').

% alice = alice. = yes
 
% 'alice' = alice. = yes (Prolog considers these to be the same)
 
% \+ (alice = albert). = yes (How to check for not equal)

    /* \+ is the negation operator. It is used to check if a goal fails. */

% 3 > 15. = no
 
% 3 >= 15. = no
 
% 3 =< 15. = yes
 
 
% W = alice. = yes
 
    /* This says that we can assign the value of alice to W and not that */
 
% W is equal to alice
 
 
% Rand1 = Rand2. = yes
 
    /* This says that any variable can be assigned anything and one of 
    those things is another variable.
    If variables can be matched up between 2 complex terms and the
    functors are equal then the complex terms are equal */
    
% rich(money, X) = rich(Y, no_debt).
% X = no_debt, Y = money.