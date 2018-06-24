package bowling

class Game {

    private var rolls: IntArray = IntArray(21)
    private var currentRoll: Int = 0

    val score: Int
        get() {
            var frameIndex = 0
            var score = 0
            for (frame in 1..10) {
                when {
                    isStrike(frameIndex) -> {
                        score += scoreStrike(frameIndex)
                        frameIndex++
                    }
                    isSpare(frameIndex) -> {
                        score += scoreSpare(frameIndex)
                        frameIndex += 2
                    }
                    else -> {
                        score += sumOfRollsInFrame(frameIndex)
                        frameIndex += 2
                    }
                }
            }
            return score
        }

    private fun isStrike(frameIndex: Int) = rolls[frameIndex] == 10

    private fun scoreStrike(frameIndex: Int) = 10 + rolls[frameIndex + 1] + rolls[frameIndex + 2]

    private fun isSpare(frameIndex: Int) = sumOfRollsInFrame(frameIndex) == 10

    private fun scoreSpare(frameIndex: Int) = 10 + rolls[frameIndex + 2]

    private fun sumOfRollsInFrame(frameIndex: Int) = rolls[frameIndex] + rolls[frameIndex + 1]

    fun roll(numPins: Int) {
        rolls[currentRoll] = numPins
        currentRoll++
    }
}
