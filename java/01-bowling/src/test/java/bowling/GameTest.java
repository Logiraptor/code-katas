package bowling;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GameTest {

    private Game game = new Game();

    @Test
    public void gutterGame() {
        rollMany(0);
        assertEquals(0, game.calculateScore());
    }

    @Test
    public void allOnes() {
        rollMany(1);
        assertEquals(20, game.calculateScore());
    }

    @Test
    public void spare() {
        rollSpare(game);
        game.roll(3);
        assertEquals(16, game.calculateScore());
    }

    @Test
    public void strike() {
        rollStrike();
        game.roll(4);
        game.roll(5);
        assertEquals(28, game.calculateScore());
    }

    @Test
    public void perfectGame() {
        rollMany(12, 10);
        assertEquals(300, game.calculateScore());
    }

    private void rollStrike() {
        game.roll(10);
    }

    private void rollSpare(Game game) {
        game.roll(5);
        game.roll(5);
    }

    private void rollMany(int numPins) {
        rollMany(20, numPins);
    }

    private void rollMany(int times, int numPins) {
        for (int i = 0; i < times; i++) {
            game.roll(numPins);
        }
    }
}
