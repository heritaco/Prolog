% consult('005_Where_is_if.pl').

    /* You can use a type of case statement instead */
 
what_grade(5) :-
    write('Go to kindergarten').

what_grade(6) :-
    write('Go to first grade').

what_grade(Other) :-
    Grade is Other - 5,
    format('Go to ~w st grade', [Grade]).

% ~w represents where to put each value in the list at the end
% ~n is a newline
% ~s is used to input strings