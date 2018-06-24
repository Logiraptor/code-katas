package bowling;

public class Game {
    private int[] rolls = new int[21];
    private int headIndex;

    public void roll(int numPins) {
        rolls[headIndex] = numPins;
        headIndex++;
    }

    public int calculateScore() {
        int sum = 0;
        for (int frame = 0, frameIndex = 0; frame < 10; frame++) {
            if (isStrike(frameIndex)) {
                sum += scoreStrike(frameIndex);
                frameIndex++;
            } else if (isSpare(frameIndex)) {
                sum += scoreSpare(frameIndex);
                frameIndex += 2;
            } else {
                sum += sumOfRollsInFrame(frameIndex);
                frameIndex += 2;
            }
        }
        return sum;
    }

    private int sumOfRollsInFrame(int frameIndex) {
        return rolls[frameIndex] + rolls[frameIndex + 1];
    }

    private int scoreSpare(int frameIndex) {
        return 10 + rolls[frameIndex + 2];
    }

    private int scoreStrike(int frameIndex) {
        return 10 + rolls[frameIndex + 1] + rolls[frameIndex + 2];
    }

    private boolean isStrike(int frameIndex) {
        return rolls[frameIndex] == 10;
    }

    private boolean isSpare(int frameIndex) {
        return sumOfRollsInFrame(frameIndex) == 10;
    }
}