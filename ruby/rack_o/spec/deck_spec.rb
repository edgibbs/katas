require "deck"

describe Deck do
  it "has a specified number of cards" do
    deck = Deck.new(52)
    deck.card_count.should == 52
  end

  it "has cards numbered 1 to N" do
    deck = Deck.new(4)
    deck.cards.should == [1, 2, 3, 4]
  end
end
