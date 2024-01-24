% consult('006_Animalitos.pl').

come(aguila, serpiente).
come(serpiente, raton).
come(raton, grillo).
come(grillo, hierba).

come(X, Y) :- come(X, Z), come(Z, Y).

% forward chaining
% aguila -> serpiente
% serpiente -> raton
% _________________________
% aguila -> raton

% backward chaining
% aguila ->  raton ??
% _________________________
% aguila -> serpiente
% serpiente -> raton    