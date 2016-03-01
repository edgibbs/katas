class Deck
  attr_accessor :card_count

  def initialize(number_of_cards)
    @cards = (1..number_of_cards).to_a
    self.card_count = number_of_cards
  end

  def cards
    @cards
  end
end
