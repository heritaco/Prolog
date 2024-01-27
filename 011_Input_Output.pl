% consult('011_Input_Output.pl').

% write('You saw me'), nl.
 
% writeq('I show quotes'), nl.
 
/* You can read data with read */
 
say_hi :-
    write('What is your name? '),
    read(X),
    write('Hi '),
    write(X).
   
  % say_hi.
   
   
  fav_char :-
    write('What is your favorite character? '),
    /* Receives a char and saves its ascii value to X */
    get(X),
    format('The Ascii value ~w is ', [X]),
    /* Outputs Ascii value as the char */
    put(X),nl.
   
  % Write to a file by defining the file, text to write, connection
   
  % to the file (Stream)
   
  write_to_file(File, Text) :-
    open(File, write, Stream),
    write(Stream, Text), nl,
    close(Stream).
   
  % Read from a file
   
  read_file(File) :-
          open(File, read, Stream),
   
          % Get char from the stream
          get_char(Stream, Char1),
   
          % Outputs the characters until end_of_file
          process_stream(Char1, Stream),
          close(Stream).
   
  % Continue getting characters until end_of_file
   
  % ! or cut is used to end backtracking or this execution
   
  process_stream(end_of_file, _) :- !.
   
  process_stream(Char, Stream) :-
          write(Char),
          get_char(Stream, Char2),
          process_stream(Char2, Stream).