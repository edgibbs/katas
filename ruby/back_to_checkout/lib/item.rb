class Item
  
  attr_reader :sku, :unit_price, :quantity, :special_price
  
  def initialize(sku)
    @sku = sku
  end
  
  def populate(price, quantity, special_price)
    @unit_price = price
    @quantity = quantity
    @special_price = special_price
    self
  end
  
  def price
    @unit_price
  end
  
end