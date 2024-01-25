% write('Hola mundo!').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

predicado(atom, atom2)
fact(constant, constant2)

% regla :-
loves(juliet, romeo) :- loves(romeo, juliet).
% H juliet loves romeo if romeo loves juliet.
% T loves(romeo, X) -> x = juliet

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

male(albert).
male(bob).

female(alice).
female(diana).

% T male(X), female(Y).
% r -> X = albert, Y = alice;

% H TIENES QUE PONER ; PARA QUE SIGAN SALIENDO LAS DEMAS OPCIONES
% H Si solo pones enter, pones un .

% r -> X = albert, Y = diana;
% r -> X = bob, Y = alice
% r -> X = bob, Y = diana

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :-
    happy(albert).

dances(alice) :-
    happy(alice),
    with_albert(alice).

