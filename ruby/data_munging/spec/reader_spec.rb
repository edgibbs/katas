require 'spec'
require File.join(File.dirname(__FILE__), '../lib/reader.rb')

describe Reader do

  context "getting a file that needs only good lines parsed into array" do
        
    before(:each) do
      @reader = Reader.new
    end
  
    it "should return an array of 40 lines when passed in the weather file" do
      @reader.get_lines('weather.dat').size.should == 40
    end
    
    it "should return an array of 41 lines when passed in the football file" do
      @reader.get_lines('football.dat').size.should == 27
    end
   
  end

end