% consult('010_Math.pl').

    /* Prolog provides 'is' to evaluate mathematical expressions */
 
% X is 2 + 2. = X = 4
 
% X is 3 + (2 * 10). =  X = 23
 
% 50 > 30. = yes
 
% (3*10) >= (50/2). = yes
 
% \+ (3 = 10). = yes (How to check for not equal)
 
% 5+4 =:= 4+5. = yes (Check for equality between expressions)
 
% 5+4 =\= 4+5. = false (Check for non-equality between expressions)
 
% 5 > 10 ; 10 < 100. (Checks if 1 OR the other is true)
 
% X is mod(7,2). = X = 1 (Modulus)
 
double_digit(X,Y) :- Y is X*2.
% double_digit(4,Y). = Y = 8
 
% random(0,10,X). (Get random value between 0 and 10)
 
% between(0,10,X). (Get all values between 0 and 10)
 
% succ(2,X). (Add 1 and assign it to X)

% X is abs(-8). (Get absolute value)
 
% X is max(10,5). (Get largest value)

% X is min(10,5). (Get smallest value)

% X is round(10.56). (Round to nearest integer)

% X is truncate(10.56). (Convert float to integer)
 
% X is floor(10.56). (Round down)

% X is ceiling(10.56). (Round up)

% X is 2**3. 2^3 (Exponent) 
 
 
% Check if a number is even
 
% 10//2 = 5 (is 10 = 2 * 5)
 
is_even(X) :- Y is X//2, X =:= 2 * Y.
 
% sqrt, sin, cos, tan, asin, acos, atan, atan2, sinh, cosh, tanh,
 
% asinh, acosh, atanh, log, log10, exp, pi, e