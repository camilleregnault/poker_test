# play poker
class Game
  # tableau avec les valeurs des cartes
  VALUES = %w[A K Q J 10 9 8 7 6 5 4 3 2].freeze
  # heart, diamonds, spades, clovers
  SUITS = %w[H D S C].freeze

  # tableau avec les combinaisons classées
  RANKS = [
    'High Card',
    'One Pair',
    'Two Pairs',
    'Three of a Kind',
    'Straight',
    'Flush',
    'Full House',
    'Four of a Kind',
    'Royal Flush'
  ]

  def high_card(first_player_hand, second_player_hand)
    p1 = card_values(first_player_hand)
    p2 = card_values(second_player_hand)
    VALUES.each do |value|
      return 1 if p1.include?(value) && !p2.include?(value)
      return 2 if p2.include?(value) && !p1.include?(value)
    end
    return 0
  end

  def royal_flush(first_player_hand, second_player_hand)
    if (all_suits?(first_player_hand) && straight?(first_player_hand, '9')) &&
      (all_suits?(second_player_hand) && straight?(second_player_hand, '9'))
      return 0
    elsif (all_suits?(first_player_hand) && straight?(first_player_hand, '9'))
      return 1
    elsif all_suits?(second_player_hand) && straight?(second_player_hand, '9')
      return 2
    end
    return 0
  end

  private 

  def straight?(hand, limit)
    hand_values = card_values(hand)
    VALUES.each do |value|
      break if value == limit
      return false if !hand_values.include?(value)
    end
    return true
  end

  def all_suits?(hand)
    hand_suits = card_suits(hand)
    hand_suits.each { |suit| return false if hand_suits[0] != suit }
    return true
  end

  def card_suits(hand)
    hand.map do |card| 
      if card.include?('10')
        card[2]
      else
        card[1]
      end
    end
  end

  def card_values(hand)
    hand.map do|card|
      if card.include?('10')
        card[0] + card[1]
      else
        card[0]
      end
    end
  end
  # comparer les 2 mains en utilisant leurs valeurs/combinaisons
  def game(hand)
    hands =  hand.split(' ')
    first_player_hand = hands.slice(0..4)
    second_player_hand = hands.slice(5..9)

    # player_one_score = 0
    # player_two_score = 0

    # if first_player_hand > second_player_hand
    #   'First player wins!'
    #   player_one_score += 1
    # elsif first_player_hand < second_player_hand
    #   'Second player wins!'
    #   player_two_score += 1
    # else 
    #   'Tie' # => calculate highest value
    # end
    
    # if player_one_score == player_two_score
    #   'Tie'
    # elsif player_one_score > player_two_score
    #   "Player 1 won #{player_one_score}"
    # else 
    #   "Player 2 won #{player_two_score}"
    # end

  end


end