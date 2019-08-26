require_relative 'poker'
require 'rspec'

describe '#game' do
  before do
  @game = Game.new()
  @royal_flush = 'AS KS QS JS 10S'
  @full_house = 'AS AH AC KS KH'
  @pair = 'AS AH 4S 3S 2S'
  @equal_pair = 'AC AD 4H 3H 2H'
  end

  it 'returns a winner for the highest card' do
    expect(@game.high_card(
      %w[2D 4C 7S JS AC],
      %w[2C 5C 7D 10S QH]
      )).to eq(1)
    expect(@game.high_card(
      %w[2D 4C 7S JS AC],
      %w[2C 5C 7D QS AH]
      )).to eq(2)
    expect(@game.high_card(
      %w[2D 5C 7S JS AC],
      %w[2C 5C 7D JS AH]
      )).to eq(0)
  end

  it 'returns a winner for the Royal Flush' do
    expect(@game.royal_flush(
      %w[10D JD QD KD AD],
      %w[2C 5C 7D 8S QH]
      )).to eq(1)
    expect(@game.royal_flush(
      %w[2D 4C 7S JS AC],
      %w[10D JD QD KD AD]
      )).to eq(2)
    expect(@game.royal_flush(
      %w[10D JC QS KS AC],
      %w[10D JS QD KD AD]
      )).to eq(0)
    expect(@game.royal_flush(
      %w[10D JD QD KD AD],
      %w[10S JS QS KS AS]
      )).to eq(0)
  end

  it 'returns a winner for the Straight Flush' do
    expect(@game.straight_flush(
      %w[2D 3D 4D 5D 6D],
      %w[2C 5C 7D 8S QH]
      )).to eq(1)
    expect(@game.straight_flush(
      %w[2D 4C 7S JS AC],
      %w[9D 10D JD KD QD]
      )).to eq(2)
    expect(@game.straight_flush(
      %w[9D JC QS KS AC],
      %w[9D JS QD KD AD]
      )).to eq(0)
    expect(@game.straight_flush(
      %w[9D 10D JD QD KD],
      %w[9S 10S JS QS KS]
      )).to eq(0)
  end

  it 'returns a winner for the Flush' do
    expect(@game.flush(
      %w[2D 3D 6D 5D 6D],
      %w[2C 5C 7D 8S QH]
      )).to eq(1)
    expect(@game.flush(
      %w[2D 4C 7S JS AC],
      %w[9D 10D JD 6D QD]
      )).to eq(2)
    expect(@game.flush(
      %w[9D JC QS KS AC],
      %w[9D JS QD KD AD]
      )).to eq(0)
    expect(@game.flush(
      %w[9D 10D JD QD KD],
      %w[9S 10S JS QS KS]
      )).to eq(0)
  end

  it 'returns a winner for the Straight' do
    expect(@game.straight(
      %w[2D 3D 4D 5S 6D],
      %w[2C 5C 7D 8S QH]
      )).to eq(1)
    expect(@game.straight(
      %w[2D 4C 7S JS AC],
      %w[9D 10D JS QD KD]
      )).to eq(2)
    expect(@game.straight(
      %w[9C JC QS KS AC],
      %w[9D JS QD KD AD]
      )).to eq(0)
    expect(@game.straight(
      %w[9D 10D 3D QD KD],
      %w[9S 10S 2S QS KS]
      )).to eq(0)
  end

  it 'returns a winner for the Four of a Kind' do
    expect(@game.four_of_a_kind(
      %w[2D 2S 2C 2H 6D],
      %w[3C 5C 7D 8S QH]
      )).to eq(1)
    expect(@game.four_of_a_kind(
      %w[3D 4C 7S JS AC],
      %w[2D 2S 2C 2H 6D]
      )).to eq(2)
    expect(@game.four_of_a_kind(
      %w[2D 2S 2C 2H 6D],
      %w[3H 3S 3C 3D AD]
      )).to eq(2)
  end

  it 'returns a winner for the Three of a Kind' do
    expect(@game.three_of_a_kind(
      %w[2D 2S 2C 3H 4D],
      %w[3C 5C 7D 8S QH]
      )).to eq(1)
    expect(@game.three_of_a_kind(
      %w[3D 4C 7S JS AC],
      %w[2D 2S 2C 5H 3D]
      )).to eq(2)
    expect(@game.three_of_a_kind(
      %w[2D 2S 2C 3H 8D],
      %w[4H 4S 4C 5D 6D]
      )).to eq(2)
  end

  it 'returns a winner for the one pair' do
    expect(@game.one_pair(
      %w[2D 2S 3C 5H 4D],
      %w[3C 5C 7D 8S QH]
      )).to eq(1)
    expect(@game.one_pair(
      %w[3D 4C 7S JS AC],
      %w[2D 2S 3C 5H 6D]
      )).to eq(2)
  end

end