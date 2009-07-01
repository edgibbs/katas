require 'spec'
require File.join(File.dirname(__FILE__), '../lib/weather_reader.rb')

describe WeatherReader do
  
  context "Reading in a weather data file from NJ 2002" do
    
    it "should read in 30 days of data" do
      reader = WeatherReader.new
      reader.days.should == 30
    end
    
    it "should return day 1 for max temperature spread" do
      reader = WeatherReader.new
      reader.max_temperature_spread.should == 1
    end
    
  end



end