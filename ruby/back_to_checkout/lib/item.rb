class Item
  
  attr_reader :sku, :unit_price, :quanity, :special_price
  
  def initialize(sku)
    @sku = sku
  end
  
  def populate(price, quanity, special_price)
    @unit_price = price
    @quanity = quanity
    @special_price = special_price
    self
  end
  
  def price
    @unit_price
  end
  
end