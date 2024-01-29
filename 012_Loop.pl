% consult('012_Loop.pl').

    /* Use recursion to loop */
 
count_to_10(10) :- write(10), nl.
 
count_to_10(X) :-
  write(X),nl,
  Y is X + 1,
  count_to_10(Y).
 
% Receives Low (lowest value) and High (highest value)
 
count_down(Low, High) :-
  % Assigns values between Low and High to Y
  between(Low, High, Y),
  % Assigns the difference to Z
  Z is High - Y + 1,
  write(Z),nl,
  Y = High.

 
count_up(Low, High) :-
  between(Low, High, Y),
  Z is Y + Low -1,
  write(Z), nl,
  Y = High.
 
% Loop until they guess a number
 
% start is a dummy value used to start the looping
 
guess_num :- loop(start).
 
% When they guess 15 they execute this message and exit
 
loop(15) :- write('You guessed it!').
 
loop(X) :-
  x \= 15,  % If X is not 15
  write('Guess Number '),
  read(Guess),
  write(Guess),
  write(' is not the number'), nl,
  loop(Guess).
 
% guess_num.
 
% Guess Number 12.
 
% 12 is not the number
 
% Guess Number 15.
 
% 15 is not the number
 
% You guessed it!

hola(X):-
    write('hola '),
    write(X).