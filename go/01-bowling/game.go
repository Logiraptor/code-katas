package game

func NewGame() *Game {
	return &Game{
		rolls: make([]int, 0, 21),
	}
}

type Game struct {
	rolls []int
}

func (g *Game) Roll(pins int) {
	g.rolls = append(g.rolls, pins)
}

func (g *Game) Score() int {
	score := 0
	frameIndex := 0
	for i := 0; i < 10; i++ {
		if g.isStrike(frameIndex) {
			score += g.strikeBonus(frameIndex)
			frameIndex++
		} else if g.isSpare(frameIndex) {
			score += g.spareBonus(frameIndex)
			frameIndex += 2
		} else {
			score += g.sumOfBallsInFrame(frameIndex)
			frameIndex += 2
		}
	}
	return score
}

func (g *Game) isStrike(frameIndex int) bool {
	return g.rolls[frameIndex] == 10
}

func (g *Game) isSpare(frameIndex int) bool {
	return g.rolls[frameIndex]+g.rolls[frameIndex+1] == 10
}

func (g *Game) strikeBonus(frameIndex int) int {
	return 10 + g.rolls[frameIndex+1] + g.rolls[frameIndex+2]
}

func (g *Game) spareBonus(frameIndex int) int {
	return 10 + g.rolls[frameIndex+2]
}

func (g *Game) sumOfBallsInFrame(frameIndex int) int {
	return g.rolls[frameIndex] + g.rolls[frameIndex+1]
}
