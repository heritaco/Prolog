factorial(1, 1).

factorial(N, Result):-
    M is N - 1,
    factorial(M, SubResult),
    Result is N * SubResult.

:- initialization(main).

main:- factorial(5, Result), write('The factorial is: '), write(Result).
