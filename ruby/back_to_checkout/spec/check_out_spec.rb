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
       @register.scan('A')
       @register.scan('B')
       @register.total.should == 80
     end
     
     it "should get a total of 115 for CDBA" do
       @register.scan('C')
       @register.scan('D')
       @register.scan('B')
       @register.scan('A')
       @register.total.should == 115
     end
    
  end
  
  context "using deals" do
    
    it "should get a total of 130 for AAA" do
      @register.scan('A')
      @register.scan('A')
      @register.scan('A')
      @register.total.should == 130 
    end
  
  end
  
end