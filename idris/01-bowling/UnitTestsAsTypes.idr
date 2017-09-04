module Main

import Data.Vect

mutual
    score_strike : Nat -> Vect n Nat -> Nat
    score_strike n [] = 10
    score_strike n (x :: []) = 10 + x + (score n (x :: []))
    score_strike n (x :: y :: xs) = 10 + x + y + (score n (x :: y :: xs))

    score_spare : Nat -> Vect n Nat -> Nat
    score_spare n [] = 10
    score_spare n (x :: xs) = 10 + x + (score n (x :: xs))

    score : Nat -> Vect n Nat -> Nat
    score _ [] = 0
    score Z _ = 0
    score (S n) ((S (S (S (S (S (S (S (S (S (S Z)))))))))) :: xs) = score_strike n xs
    score (S n) (x :: y :: xs) = if x + y == 10 then score_spare n xs else x + y + score n xs
    score (S n) (x :: xs) = x + score n xs

    score_game : Vect n Nat -> Nat
    score_game = score 10


gutterGame : score_game (replicate 20 0) = 0
gutterGame = Refl

onePinGames : score_game (replicate 20 1) = 20
onePinGames = Refl

strike : score_game ([10, 3, 5] ++ replicate 16 0) = 26
strike = Refl

spare : score_game ([5, 5, 3] ++ replicate 17 0) = 16
spare = Refl

perfectGame : score_game (replicate 12 10) = 300
perfectGame = Refl

total
gutterGamesWithNRolls : (n : Nat) -> score n (replicate (mult n 2) 0) = 0
gutterGamesWithNRolls Z = Refl
gutterGamesWithNRolls (S k) = gutterGamesWithNRolls k

total
onePinGamesWithNFrames : (n : Nat) -> score n (replicate (mult n 2) 1) = (mult n 2)
onePinGamesWithNFrames Z = Refl
onePinGamesWithNFrames (S k) =
    let lhs = score k (replicate (mult k 2) 1) in
    let rhs = mult k 2 in
        eqSucc (S lhs) (S rhs) (eqSucc lhs rhs (onePinGamesWithNFrames k))

total
strikesSumNextTwoRolls : (a : Nat) -> (b: Nat) -> score 1 [10, a, b] = 10 + a + b
strikesSumNextTwoRolls a b = rewrite plusZeroRightNeutral (plus a b) in Refl

total
spare55SumsNextRoll : (a : Nat) -> score 1 [5, 5, a] = 10 + a
spare55SumsNextRoll a = rewrite plusZeroRightNeutral a in Refl

main : IO ()
main = putStrLn "Hello, World!"
