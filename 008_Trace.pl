% consult('008_Trace.pl').

/* Using trace we can see how Prolog evaluates queries one at a time */
 
warm_blooded(penguin).
warm_blooded(human).
 
produce_milk(penguin).
produce_milk(human).
 
have_feathers(penguin).
have_hair(human).
 
mammal(X) :-
  warm_blooded(X),
  produce_milk(X),
  have_hair(X).
 
 
% trace.
% notrace. /* Turns off trace */
 
% mammal(human).
% Correct to: "mammal(human)"? 
% Please answer 'y' or 'n'? yes
%    Call: (10) mammal(human) ? creep
%    Call: (11) warm_blooded(human) ? creep
%    Exit: (11) warm_blooded(human) ? creep
%    Call: (11) produce_milk(human) ? creep
%    Exit: (11) produce_milk(human) ? creep
%    Call: (11) have_hair(human) ? creep
%    Exit: (11) have_hair(human) ? creep
%    Exit: (10) mammal(human) ? creep
% true.
 
 
% mammal(penguin).
%    Call: (10) mammal(penguin) ? creep
%    Call: (11) warm_blooded(penguin) ? creep
%    Exit: (11) warm_blooded(penguin) ? creep
%    Call: (11) produce_milk(penguin) ? creep
%    Exit: (11) produce_milk(penguin) ? creep
%    Call: (11) have_hair(penguin) ? creep
%    Fail: (11) have_hair(penguin) ? creep
%    Fail: (10) mammal(penguin) ? creep
% false.
 
% notrace. 
 
/* Output what ever matches the clauses */

% warm_blooded(X), produce_milk(X), write(X),nl.