class CheckOut
  
  def initialize(pricing_rules) 
    @cart = ""
    @pricing_rules = []
    @pricing_rules = pricing_rules
    @unit_prices = {}
    pricing_rules.each do | item |
      @unit_prices[item.sku] = item.unit_price
    end
  end
  
  def scan(sku)
    @cart << sku
  end
  
  def price(sku)
    @unit_prices[sku]
  end
  
  def total() 
    total = subTotalFromDeals()
    @cart.split(//).each do | sku |
      total = total + @unit_prices[sku]
    end
    total
  end
  
  private
  
  def subTotalFromDeals()
    sub_total = 0
    deals = {}
    @pricing_rules.each do | item |
      if (item.quantity && item.special_price)
        deals[item.sku * item.quantity] = item.special_price
      end
    end
    
    deals.each do | key, value |
      hits = @cart.scan(key)
      sub_total = sub_total + (value * hits.size)
      hits.size.times do
        @cart.slice!(key)
      end
    end
    sub_total
  end
  
  # def subTotalFromDeals()
  #   sub_total = 0
  #   item_totals = {}
  #   item_total.default = 0
  #   @cart.each do | item |
  #     item_totals[item.sku] = item_totals[item.sku] + 1
  #   end
  #   
  #   @pricing_rules.each do | item |
  #     if (item_totals[item.sku] >= item.quantity)
  #       sub_total = subtotal + item.special_price
  #     end
  #   end
  # end
  
  

end