package bowling

import org.junit.Assert.assertEquals
import org.junit.Test

class GameTest {
    private val game = Game()

    @Test
    fun gutterGame() {
        game.rollMany(0)
        assertEquals(0, game.score)
    }

    @Test
    fun allOnes() {
        game.rollMany(1)
        assertEquals(20, game.score)
    }

    @Test
    fun spare() {
        game.rollSpare()
        game.roll(3)
        assertEquals(16, game.score)
    }

    @Test
    fun strike() {
        game.rollStrike()
        game.roll(5)
        game.roll(3)
        assertEquals(26, game.score)
    }

    @Test
    fun perfectGame() {
        game.rollMany(10, 12)
        assertEquals(300, game.score)
    }

    private fun Game.rollSpare() {
        roll(5)
        roll(5)
    }

    private fun Game.rollMany(numPins: Int, numRolls: Int = 20) {
        for (i in 1..numRolls) {
            roll(numPins)
        }
    }

    private fun Game.rollStrike() {
        roll(10)
    }
}
