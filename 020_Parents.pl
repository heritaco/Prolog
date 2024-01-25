% Facts
parent(john, jim).
parent(john, ann).
parent(jim, billy).

% Rule
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

