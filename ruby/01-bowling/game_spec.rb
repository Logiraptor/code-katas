require_relative './game'

describe 'Game' do
  let(:game) { Game.new }

  def roll_many(n, pins)
    n.times do
      game.roll(pins)
    end
  end

  def roll_spare
    game.roll(5)
    game.roll(5)
  end

  def roll_strike
    game.roll(10)
  end

  describe 'gutter game' do
    it 'reports 0 score' do
      roll_many(20, 0)
      expect(game.score).to eq 0
    end
  end

  describe 'all ones' do
    it 'reports score 20' do
      roll_many(20, 1)
      expect(game.score).to eq 20
    end
  end

  describe 'one spare' do
    it 'reports score based on next roll' do
      roll_spare
      game.roll(3)
      roll_many(17, 0)
      expect(game.score).to eq 16
    end
  end

  describe 'one strike' do
    it 'reports score based on next two rolls' do
      roll_strike
      game.roll(3)
      game.roll(4)
      roll_many(16, 0)
      expect(game.score).to eq 24
    end
  end

  describe 'perfect game' do
    it 'reports score of 300' do
      roll_many(12, 10)
      expect(game.score).to eq 300
    end
  end
end
