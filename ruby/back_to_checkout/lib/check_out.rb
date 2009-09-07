class CheckOut
  
  def initialize(pricing_rules) 
    @cart = []
    @pricing_rules = []
    @pricing_rules = pricing_rules
    @unit_prices = {}
    pricing_rules.each do | item |
      @unit_prices[item.sku] = item.unit_price
    end
  end
  
  def scan(sku)
    @cart.push (Item.new(sku))
  end
  
  def price(sku)
    @unit_prices[sku]
  end
  
  def total() 
    total = 0
    @cart.each do | item |
      total = total + @unit_prices[item.sku]
    end
    total
  end

end