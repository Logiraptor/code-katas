:- [game].

assertEqual(S, S) :- !.
assertEqual(Expected, Actual) :-
    format('Expected ~d, got: ~d\n', [Expected, Actual]), fail.

assertScore(Rolls, ExpectedScore) :-
    score(Rolls, Score),
    assertEqual(ExpectedScore, Score).

rollMany(0, _, []).
rollMany(N, Pins, [Pins|Rest]) :-
    N1 is N - 1,
    rollMany(N1, Pins, Rest).

testGutterGame :-
    rollMany(20, 0, Rolls),
    assertScore(Rolls, 0).

testAllOnes :-
    rollMany(20, 1, Rolls),
    assertScore(Rolls, 20).

testSpare :-
    Start = [5,5,3], % spare, then a 3
    rollMany(17, 0, Rest),
    append(Start, Rest, Rolls),!,
    assertScore(Rolls, 16).

testStrike :-
    Start = [10,3,4], % strike, then 3,4
    rollMany(16, 0, Rest),
    append(Start, Rest, Rolls),!,
    assertScore(Rolls, 24).

testPerfectGame :-
    rollMany(11, 10, Rolls),!,
    assertScore(Rolls, 300).

main :- 
    testGutterGame,!,
    testAllOnes,!,
    testSpare,!,
    testStrike,!,
    testPerfectGame,!,

    print(pass).
