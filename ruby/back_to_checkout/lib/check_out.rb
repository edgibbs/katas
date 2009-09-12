class CheckOut
  
  def initialize(pricing_rules) 
    @deals = {}
    @cart = ""
    @unit_prices = {}
    load_price_rules(pricing_rules)
  end
  
  def scan(sku)
    @cart << sku
  end
  
  def total() 
    saved_cart = @cart
    total = subtotal_from_deals()
    @cart.split(//).each do | sku |
      total = total + @unit_prices[sku]
    end
    @cart = saved_cart
    total
  end
  
  private
  
  def load_price_rules(pricing_rules)
    pricing_rules.each do | item |
      @unit_prices[item.sku] = item.unit_price
      if (item.quantity && item.special_price)
         @deals[item.sku * item.quantity] = item.special_price
       end
    end
  end
  
  def subtotal_from_deals()
    sub_total = 0
    @deals.each do | key, value |
      @cart = @cart.split(//).sort.join
      hits = @cart.scan(key)
      sub_total = sub_total + (value * hits.size)
      hits.size.times do
        @cart.slice!(key)
      end
    end
    sub_total
  end  

end