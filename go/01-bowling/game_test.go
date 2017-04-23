package game

import "testing"

func rollMany(game *Game, n, pins int) {
	for i := 0; i < n; i++ {
		game.Roll(pins)
	}
}

func rollSpare(game *Game) {
	game.Roll(5)
	game.Roll(5)
}

func rollStrike(game *Game) {
	game.Roll(10)
}

func TestGutterGame(t *testing.T) {
	game := NewGame()
	rollMany(game, 20, 0)
	if score := game.Score(); score != 0 {
		t.Errorf("expected 0, got: %d", score)
	}
}

func TestAllOnes(t *testing.T) {
	game := NewGame()
	rollMany(game, 20, 1)
	if score := game.Score(); score != 20 {
		t.Errorf("expected 20, got: %d", score)
	}
}

func TestSpare(t *testing.T) {
	game := NewGame()
	rollSpare(game)
	game.Roll(4)
	rollMany(game, 17, 0)
	if score := game.Score(); score != 18 {
		t.Errorf("expected 18, got: %d", score)
	}
}

func TestStrike(t *testing.T) {
	game := NewGame()
	rollStrike(game)
	game.Roll(3)
	game.Roll(4)
	rollMany(game, 16, 0)
	if score := game.Score(); score != 24 {
		t.Errorf("expected 27, got: %d", score)
	}
}

func TestPerfectGame(t *testing.T) {
	game := NewGame()
	rollMany(game, 12, 10)
	if score := game.Score(); score != 300 {
		t.Errorf("expected 300, got: %d", score)
	}
}
