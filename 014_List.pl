% consult('013_List.pl').

% You can store atoms, complex terms, variables, numbers and other
 
% lists in a list
 
% They are used to store data that has an unknown number of elements
 
 
% We can add items to a list with the | (List Constructor)
 
% write([albert|[alice, bob]]), nl.
 
 
% Get the length of a list
 
% length([1,2,3], X).
 
 
% We can divide a list into its head and tail with |
 
% [H|T] = [a,b,c].
 
 
% H = a
 
% T = [b,c]
 
 
% We can get additional values by adding more variables to the left
 
% of |
 
 
%[X1, X2, X3, X4|T] = [a,b,c,d].
 
 
% We can use the anonymous variable _ when we need to reference a
 
% variable, but we don't want its value
 
% Let's get the second value in the list
 
% [_, X2, _, _|T] = [a,b,c,d].
 
 
% We can use | to access values of lists in lists
 
% [_, _, [X|Y], _, Z|T] = [a, b, [c, d, e], f, g, h].
 
 
% Find out if a value is in a list with member
 
% List1 = [a,b,c].
 
% member(a, List1). = yes
 
 
% We could also get all members of a list with a variable
 
% member(X, [a, b, c, d]).
 
 
% Reverse a list
 
% reverse([1,2,3,4,5], X).
 
 
% Concatenate 2 lists
 
% append([1,2,3], [4,5,6], X).
 
 
% Write items in list on separate line
 
write_list([]).
 
write_list([Head|Tail]) :-
  write(Head), nl,
  write_list(Tail).
% write_list([1,2,3,4,5]). = Outputs the list
 