
score(Input, Score) :-
    phrase(game(Score), Input).

game(Score) --> 
    frame(PartialScore), !,
    game(PartialScore2),
    {Score is PartialScore + PartialScore2}.

game(0) --> [].

frame(Score) --> strike(Score).
frame(Score) --> spare(Score).
frame(Score) --> nobonus(Score).

strike(Score) --> [10], !, peek([R1, R2]), {Score is 10 + R1 + R2}.
spare(Score) --> [A, B], {10 is A + B}, !, peek([R1]), {Score is 10 + R1}.
nobonus(Score) --> [A, B], {Score is A + B}.

peek([]) --> [].
peek([H|T]), [H] --> [H], !, peek(T).
peek([0|T]) --> peek(T).
