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

  # it 'returnq the winner' do
  #   expect(game('5H 5C 6S 7S KD 2C 3S 8S 8D TD')).to eq('Player 2 wins!')
  #   expect(game('5D 8C 9S JS AC 2C 5C 7D 8S QH')).to eq('Player 1 wins!')
  #   expect(game('2D 9C AS AH AC 3D 6D 7D TD QD')).to eq('Player 2 wins!')
  #   expect(game('4D 6S 9H QH QC 3D 6D 7H QD QS')).to eq('Player 1 wins!')
  #   expect(game('2H 2D 4C 4D 4S 3C 3D 3S 9S 9D')).to eq('Player 1 wins!')
  # end

end