require 'spec'
require File.join(File.dirname(__FILE__), '../lib/check_out.rb')
require File.join(File.dirname(__FILE__), '../lib/item.rb')

describe CheckOut do
  
  before(:each) do
    items = []
    items.push Item.new('A').populate(50, 3, 130)
    items.push Item.new('B').populate(30, 2, 45)
    items.push Item.new('C').populate(20, 0, 0)
    items.push Item.new('D').populate(15, 0, 0)
    @register = CheckOut.new(items)
  end
  
  context "no deals involved" do
    
    it "should get a total of zero for no items selected" do
      @register.total.should == 0
    end
    
    it "should get a total of 50 for item A" do
       @register.scan('A')
       @register.total.should == 50
     end
     
     it "should get a total of 80 for A and B" do
       scanItems('AB')
       @register.total.should == 80
     end
     
     it "should get a total of 115 for CDBA" do
       scanItems('CDBA')
       @register.total.should == 115
     end
    
  end
  
  context "using deals" do
    
    it "should get a total of 130 for AAA" do
      scanItems('AAA')
      @register.total.should == 130 
    end
    
    it "should get a total of 180 for AAAA" do
      scanItems('AAAA')
      @register.total.should == 180
    end
    
    it "should get a total of 230 for AAAAA" do
      scanItems('AAAAA')
      @register.total.should == 230
    end
    
    it "should get a total of 260 for AAAAAA" do
      scanItems('AAAAAA')
      @register.total.should == 260
    end
    
    it "should get a total of 160 for AAAB" do
      scanItems('AAAB')
      @register.total.should == 160
    end
    
    it "should get a total of 175 for AAABB" do
      scanItems('AAABB')
      @register.total.should == 175
    end
    
    it "should get a total of 190 for AAABBD" do
      scanItems('AAABBD')
      @register.total.should == 190
    end
    
    it "should get a total of 190 for DABABA" do
      scanItems('DABABA')
      @register.total.should == 190
    end
  
  end
  
  context "total adding incrementally" do
  
    it "should add correctly with each item and 175 for the final total" do
      @register.total.should == 0
      @register.scan('A')
      @register.total.should == 50
      @register.scan('B')
      @register.total.should == 80
      @register.scan('A')
      @register.total.should == 130
      @register.scan('A')
      @register.total.should == 160
      @register.scan('B')
      @register.total.should == 175
    end
  
  end

  private
  
  def scanItems(items)
     items.split(//).each do | sku |
        @register.scan(sku)
      end
  end
  
end