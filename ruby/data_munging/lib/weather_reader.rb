require 'logger'
require './lib/reader.rb'

class WeatherReader
  
  $LOG = Logger.new($stderr)
  STARTS_WITH_2_OR_3_SPACES_AND_THEN_A_DIGIT = /^\s{2,3}\d/
  
  def initialize
    @temperature_spreads = {}
    reader = Reader.new
    weather_lines = reader.get_lines('weather.dat')
    weather_lines = reader.get_good_lines(weather_lines, STARTS_WITH_2_OR_3_SPACES_AND_THEN_A_DIGIT)
    create_temperature_spreads(weather_lines)
  end
  
  def max_temperature_spread
    largest_spread = 0
    max_day = 1
    @temperature_spreads.each do | day, spread |
      if spread > largest_spread
        max_day = day
        largest_spread = spread
      end
    end
    return max_day
  end
  
private
  
  def create_temperature_spreads(lines)
    lines.each do | line |
      day = line.slice(2,3).strip.to_i
      max = line.slice(6,7).strip.to_i
      min = line.slice(12,13).strip.to_i
      @temperature_spreads[day] = max - min
    end
  end
  
end