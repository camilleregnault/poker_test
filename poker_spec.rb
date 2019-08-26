require_relative 'poker'

require 'rspec'

describe '#game' do
  before do  
  @royal_flush = 'AS KS QS JS 10S'
  @full_house = 'AS AH AC KS KH'
  @pair = 'AS AH 4S 3S 2S'
  @equal_pair = 'AC AD 4H 3H 2H'
  end

  it '' do
    expect(game('5H 5C 6S 7S KD 2C 3S 8S 8D TD')).to eq('Player 2 wins!')
    expect(game('5D 8C 9S JS AC 2C 5C 7D 8S QH')).to eq('Player 1 wins!')
    expect(game('2D 9C AS AH AC 3D 6D 7D TD QD')).to eq('Player 2 wins!')
    expect(game('4D 6S 9H QH QC 3D 6D 7H QD QS')).to eq('Player 1 wins!')
    expect(game('2H 2D 4C 4D 4S 3C 3D 3S 9S 9D')).to eq('Player 1 wins!')
  end

end