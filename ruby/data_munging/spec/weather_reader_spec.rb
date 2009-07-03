require 'spec'
require File.join(File.dirname(__FILE__), '../lib/weather_reader.rb')

describe WeatherReader do
  
  context "Reading in a weather data file from NJ 2002" do
    
    it "should return day 9 for max temperature spread" do
      reader = WeatherReader.new
      reader.max_temperature_spread.should == 9
    end
    
  end



end