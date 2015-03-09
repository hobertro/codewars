=begin

http://www.codewars.com/kata/5436fdf34e3d6cb156000350/train/ruby

Flexible Card Game - 6kyu

Create any card game!

Create a Card Game library of classes which could be used to create any number of basic card games. You'll need at least a Deck class and a Card class.

Deck functionality

A deck has a public attribute:

cards: array of remaining cards in the deck.

...and three public methods:

count(): count of remaining cards in the deck.

shuffle(): randomize the order of the remaining cards in the deck.

draw(n): remove the last n cards from the deck and return them in an array.

Upon initialization, a deck is filled with 52 cards (13 from each of 4 suits).

Card functionality

A card has these public attributes:

suit: a symbol representing the suit of the card.
rank: an integer from 1 to 13. ("ace" is 1, "king" is 13)
Javascript: face_card: is this card a face card? (> 10)
...and these methods:

Ruby: face_card?: is this card a face card? (> 10)
to_s (JS:toString()) : human-readable string representation of the card (e.g. "Ace of Spades", "10 of Clubs", "Queen of Hearts")
Cards must be Comparable to other cards. Compare the ranks of the cards only.

Since this is a low level layer to build card games above, all test input will be valid. All ranks will be between 1 and 13 and all suits will be one of

Ruby: :hearts, :diamonds, :spades, :clubs
Javascript: Card.HEARTS, Card.DIAMONDS, Card.CLUBS, Card.SPADES

My solution:

=end

class Card
  include Comparable
  
  FACE_CARDS = { 11 => "jack", 12 => "queen", 13 => "king", 1 => "ace" }

  attr_accessor :suit
  attr_accessor :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def face_card?
    return true if rank > 10
    false
  end

  def to_s
    if FACE_CARDS.has_key?(rank)
      return "#{FACE_CARDS[rank].capitalize} of #{suit.capitalize}"
    end
    "#{rank} of #{suit.capitalize}"
  end
  
  def <=>(card2)
    if self.rank > card2.rank
      return 1
    elsif self.rank == card2.rank
      return 0
    else
      -1
    end
  end

end


class Deck

  SUITS = ["club", "heart", "diamonds", "spades" ]
  
  attr_accessor :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      (1..13).each do |rank|
        card = Card.new(suit, rank)
        @cards << card
      end
    end
  end

  def shuffle
    cards.shuffle!
  end

  def draw(n = 1)
    drawn_cards = []
    (1..n).each do |x|
      removed_card = cards.pop()
      drawn_cards << removed_card
    end
    return drawn_cards.reverse()
  end

  def count
    cards.count
  end

end