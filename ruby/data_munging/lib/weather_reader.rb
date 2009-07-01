class WeatherReader
  
  def initialize
    @lines = 0
    @temperature_spreads = {}
    read_weather_file
  end
  
  def days
    @lines
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

  def read_weather_file
    lines = []
    open(File.join(File.dirname(__FILE__), '../data/weather.dat')).each do |line|
      lines << line
    end
    
    lines.each do |line|
      weather_lines = []
      if (1..31).include?(line.slice(0,4).strip.to_i)
        parse_to_temperature_spread(line)
        weather_lines << line
        @lines = @lines + 1
      end
    end
    
    
    
  end
  
private
  
  def parse_to_temperature_spread(line)
    day = line.slice(2,3).strip.to_i
    max = line.slice(6,7).strip.to_i
    min = line.slice(13,14).strip.to_i
    @temperature_spreads[day] = max - min
  end
  
  
  
  
end