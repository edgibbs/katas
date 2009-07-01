require 'spec'
require File.join(File.dirname(__FILE__), '../lib/binary_search.rb')

describe BinarySearch do
  
  before(:all) do
    @searcher = BinarySearch.new
  end
  
  context "searching for an empty array" do
    
    it "should return -1" do
      @searcher.chop(3, []).should == -1
    end
    
  end
  
  context "searching [1]" do

    it "should return -1 when searching for 3" do
      @searcher.chop(3, [1]).should == -1
    end
    
    it "should return 0 when searching for 1" do
      @searcher.chop(1, [1]).should == 0
    end
 
  end
  
  context "searching [1, 3, 5]" do
    
    it "should return 0 when searching for 1" do
      @searcher.chop(1, [1, 3, 5]).should == 0
    end
    
    it "should return 1 when searching for 3" do
      @searcher.chop(3, [1, 3, 5]).should == 1
    end
    
    it "should return 2 when searching for 5" do
      @searcher.chop(5, [1, 3, 5]).should == 2
    end
    
    it "should return -1 when searching for 0, 2, 4, or 6" do
      @searcher.chop(0, [1, 3, 5]).should == -1
      @searcher.chop(2, [1, 3, 5]).should == -1
      @searcher.chop(4, [1, 3, 5]).should == -1
      @searcher.chop(6, [1, 3, 5]).should == -1
    end
    
  end
  
  context "searching [1, 3, 5, 7]" do
    
    it "should return 0 when searching for 1" do
      @searcher.chop(1, [1, 3, 5, 7]).should == 0
    end
    
    it "should return 1 when searching for 3" do
      @searcher.chop(3, [1, 3, 5, 7]).should == 1
    end
    
    it "should return 2 when searching for 5" do
      @searcher.chop(5, [1, 3, 5, 7]).should == 2
    end
    
    it "should return 3 when searching for 7" do
      @searcher.chop(7, [1, 3, 5, 7]).should == 3
    end
    
    it "should return -1 when searching for 0,2,4,6 or 8" do
      @searcher.chop(0, [1, 3, 5, 7]).should == -1
      @searcher.chop(2, [1, 3, 5, 7]).should == -1
      @searcher.chop(4, [1, 3, 5, 7]).should == -1
      @searcher.chop(6, [1, 3, 5, 7]).should == -1
      @searcher.chop(8, [1, 3, 5, 7]).should == -1
    end
    
  end

  
end