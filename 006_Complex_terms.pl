% consult('006_Complex_terms').

    /* A Structure is an object made up from many other objects (components)
    Structures allow us to add context about what an object is to avoid confusion
    has(albert,olive)
    Does Albert have a pet named Olive?
    Does Albert have the food named Olive?
    
    Structures have a functor followed by a list of arguments
    The number of arguments a Structure has is its arity
    female(alice). has an arity of one
    Albert owns a pet cat named Olive */
    
/* This is a recursive definition */
 
owns(albert, pet(cat, olive)).

% owns(albert, pet(cat, X)). : X = olive


customer(tom, smith, 20.55).
customer(sally, smith, 120.55).
% customer(sally,_,Bal). : Bal = 120.55 

    /*An anonymous variable is used when we don't want a value returned
    Is there a customer named sally and what is her balance */

/* tab puts the defined number of spaces on the screen
~2f says we want a float with 2 decimals */
get_cust_bal(FName, LName) :- customer(FName, LName, Bal),
  write(FName), tab(1),
  format('~w owes us $~2f ~n', [LName, Bal]).
 
    /* Use a complex term to define what it means to be a vertical */
 
% versus a horizontal line
 
vertical(line(point(X, Y), point(X, Y2))).
horizontal(line(point(X, Y), point(X2, Y))).
 
% vertical(line(point(5, 10), point(5, 20))). = yes
 
% horizontal(line(point(10, 20), point(30, 20))).
 
    /* We can also ask what the value of a point should be to be vertical */
% vertical(line(point(5, 10), point(X, 20))). = X = 5
 
    /* We could also ask for the X and Y points */
% vertical(line(point(5, 10), X)). = X = point(5,_)