% consult('004_Variables.pl').

  /* A variable is an object we are unable to name when writing a program.
  An instantiated variable is one that stands for an object.
  A variable begins with an uppercase letter or _ and can contain
  the same symbols as atoms.
  The same variable name used in 2 different questions represents 2
  completely different variables.
  An uninstantiated variable can be used to search for any match. */

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

  /* When you are cycling through the results the no at the end signals
  that there are no more results */
 
% parent(X, bob). X = albert, X = alice
% who are bobs parents? albert and alice

% parent(X, bob), dances(X). X = alice
% who is bob's parent that dances? alice 
 
% Who is Bobs parent? Does he have parents?
 
% parent(Y, carl), parent(X, Y). = X = albert, Y = bob, X = alice
% who is carl's grandparent?, who is the parent of carl's parent?.
% Y = bob
 
 
% Find Alberts grandchildren

% Is Albert a father? Does his children have any children? 
% parent(albert, X), parent(X, Y). = X = bob, Y = carl, X = bob, 
% Y = charlie
 
 
% Use custom predicate for multiple results
 
get_grandchild :- parent(albert, X), parent(X, Y),
              write('Alberts grandchild is '),
              write(Y), nl.
% en la terminal: get_grandchild. 
% luego ponemos ; para ver el otro resultado 

  /* Do Carl and Charlie share a parent
  Who is Carls parent? Is this same X a parent of Charlie */
% parent(X, carl), parent(X, charlie). = X = bob
 
% ~w represents where to put each value in the list at the end
% ~n is a newline
% ~s is used to input strings
 
get_grandparent :- parent(X, carl),
                parent(X, charlie),
                format('~w ~s grandparent~n', [X, "is the"]).

  /* Does Carl have an Uncle?
    Who is Carls parent? Who is Carls fathers brother? */
 
brother(bob, bill).
% parent(X, carl), brother(X, Y). = X = bob, Y = bill



% Demonstrate axioms and derived facts
% We can also use variables in the database
% If you get the singleton warning, that means you defined a variable
% that you didn't do anything with. (This is ok sometimes)
 
grand_parent(X, Y) :-
  parent(Z, X),
  parent(Y, Z).
% grand_parent(carl, A). = A = albert; A = alice
 
 
% X blushes if X is human

blushes(X) :- human(X).
human(derek).
 
% If we say one thing is true when somehing else is true, we can also
% find that match if we only assign one thing to be true here.
% blushes(derek). = yes
 
 
% Another example on cause and effect
 
stabs(tybalt,mercutio,sword).
hates(romeo, X) :- stabs(X, mercutio, sword).
% hates(romeo, X). = X = tybalt
 
 

 