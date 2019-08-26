# frozen_string_literal: true

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
  ].freeze

  def high_card(first_player_hand, second_player_hand)
    p1 = card_values(first_player_hand)
    p2 = card_values(second_player_hand)
    VALUES.each do |value|
      return 1 if p1.include?(value) && !p2.include?(value)
      return 2 if p2.include?(value) && !p1.include?(value)
    end

    0
  end

  def one_pair(first_player_hand, second_player_hand)
    p1 = card_occurences(first_player_hand)
    p2 = card_occurences(second_player_hand)
    if p1.max_by{ |_k, v| v }[1] == 2 && p2.max_by{ |_k, v| v }[1] == 2
      return 1 if p1.max_by{ |_k, v| v }[0].to_i > p2.max_by{ |_k, v| v }[0].to_i

      return 2
    elsif p1.max_by{ |_k, v| v }[1] == 2
      return 1
    elsif p2.max_by{ |_k, v| v }[1] == 2
      return 2
    end

    0
  end

  def two_pairs(first_player_hand, second_player_hand)
    # not enought time
  end

  def three_of_a_kind(first_player_hand, second_player_hand)
    p1 = card_occurences(first_player_hand)
    p2 = card_occurences(second_player_hand)
    if p1.max_by{ |_k, v| v }[1] == 3 && p2.max_by{ |_k, v| v }[1] == 3
      return 1 if p1.max_by{ |_k, v| v }[0].to_i > p2.max_by{ |_k, v| v }[0].to_i

      return 2
    elsif p1.max_by{ |_k, v| v }[1] == 3
      return 1
    elsif p2.max_by{ |_k, v| v }[1] == 3
      return 2
    end

    0
  end

  def straight(first_player_hand, second_player_hand)
    if straight?(first_player_hand, higher_card(first_player_hand)) &&
       straight?(second_player_hand, higher_card(second_player_hand))
      return 0
    elsif straight?(first_player_hand, higher_card(first_player_hand))
      return 1
    elsif straight?(second_player_hand, higher_card(second_player_hand))
      return 2
    end

    0
  end

  def flush(first_player_hand, second_player_hand)
    if all_suits?(first_player_hand) && all_suits?(second_player_hand)
      return 0
    elsif all_suits?(first_player_hand)
      return 1
    elsif all_suits?(second_player_hand)
      return 2
    end

    0
  end

  def full_house(first_player_hand, second_player_hand)
    # not enought time
  end

  def four_of_a_kind(first_player_hand, second_player_hand)
    p1 = card_occurences(first_player_hand)
    p2 = card_occurences(second_player_hand)
    if p1.max_by{ |_k, v| v }[1] == 4 && p2.max_by{ |_k, v| v }[1] == 4
      return 1 if p1.max_by{ |_k, v| v }[0].to_i > p2.max_by{ |_k, v| v }[0].to_i

      return 2
    elsif p1.max_by{ |_k, v| v }[1] == 4
      return 1
    elsif p2.max_by{ |_k, v| v }[1] == 4
      return 2
    end

    0
  end

  def straight_flush(first_player_hand, second_player_hand)
    if (all_suits?(first_player_hand) &&
       straight?(first_player_hand, higher_card(first_player_hand))) &&
       (all_suits?(second_player_hand) &&
       straight?(second_player_hand, higher_card(second_player_hand)))
      return 0
    elsif all_suits?(first_player_hand) && 
          straight?(first_player_hand, higher_card(first_player_hand))
      return 1
    elsif all_suits?(second_player_hand) && 
          straight?(second_player_hand, higher_card(second_player_hand))
      return 2
    end

    0
  end

  def royal_flush(first_player_hand, second_player_hand)
    if (all_suits?(first_player_hand) && straight?(first_player_hand, 'A')) &&
       (all_suits?(second_player_hand) && straight?(second_player_hand, 'A'))
      return 0
    elsif all_suits?(first_player_hand) && straight?(first_player_hand, 'A')
      return 1
    elsif all_suits?(second_player_hand) && straight?(second_player_hand, 'A')
      return 2
    end

    0
  end

  private

  def card_occurences(hand)
    hand_values = card_values(hand)
    counts = Hash.new(0)
    hand_values.each { |value| counts[value] += 1 }
    counts
  end

  def higher_card(hand)
    hand_values = card_values(hand)
    VALUES.each do |value|
      return value if hand_values.include?(value)
    end
  end

  def straight?(hand, limit)
    return false if %w[5 4 3 2].include?(limit)

    hand_values = card_values(hand)
    higher_card_index = VALUES.find_index(limit)

    VALUES.each_with_index do |value, index|
      break if index == (higher_card_index + 5)

      if index >= higher_card_index
        return false unless hand_values.include?(value)
      end
    end

    true
  end

  def all_suits?(hand)
    hand_suits = card_suits(hand)
    hand_suits.each { |suit| return false if hand_suits[0] != suit }
    true
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
    hand.map do |card|
      if card.include?('10')
        card[0] + card[1]
      else
        card[0]
      end
    end
  end
end
