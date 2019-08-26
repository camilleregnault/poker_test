# tableau avec les valeurs des cartes
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
# heart, diamonds, spades, clovers
SUITS = %w(H D S C)

# tableau avec les combinaisons classées
RANKS = [
  'Hight Card',
  'One Pair',
  'Two Pairs', 
  'Three of a Kind',
  'Straight',
  'Flush', 
  'Full House',
  'Four of a Kind',
  'Royal Flush'
]

# comparer les 2 mains en utilisant leurs valeurs/combinaisons
def game(hand)
  hands =  hand.split(' ')
  first_player_hand = hands.slice(0..4)
  second_player_hand = hands.slice(5..9)

  player_one_score = 0
  player_two_score = 0

  if first_player_hand > second_player_hand
    'First player wins!'
    player_one_score += 1
  elsif first_player_hand < second_player_hand
    'Second player wins!'
    player_two_score += 1
  else 
     'Tie' # => calculate highest value
  end
  
  if player_one_score == player_two_score
    'Tie'
  elsif player_one_score > player_two_score
    "Player 1 won #{player_one_score}"
  else 
    "Player 2 won #{player_two_score}"
  end

end