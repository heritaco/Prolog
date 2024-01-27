% consult ('014_Strings.pl').

% Convert a string into an Ascii character list
 
% name('A random string', X).
 
 
% Convert a Ascii character list into a string
 
% name(X, [65,32,114,97,110,100,111,109,32,115,116,114,105,110,103]).
 
 
% Append can join strings
 
join_str(Str1, Str2, Str3) :-
 
    % Convert strings into lists
    name(Str1, StrList1),
    name(Str2, StrList2),
   
    % Combine string lists into new string list
    append(StrList1, StrList2, StrList3),
   
    % Convert list into a string
    name(Str3, StrList3).
   
  % join_str('Another ', 'Random String', X). = X = 'Another Random String'
   
   
  % get the 1st char from a string
   
  /*
  name('Derek', List),
  nth0(0, List, FChar),
  put(FChar).
  */
   
  % Get length of the string
   
  atom_length('Derek',X).