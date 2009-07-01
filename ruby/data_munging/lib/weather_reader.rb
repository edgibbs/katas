class WeatherReader
  
  def initialize
    @lines = 0
    read_weather_file
  end
  
  def days
    @lines
  end
  
private

  def read_weather_file
    lines = []
    open(File.join(File.dirname(__FILE__), '../data/weather.dat')).each do |line|
      lines << line
    end
    
    lines.each do |line|
      if (1..31).include?(line.slice(0,4).strip.to_i) 
        @lines = @lines + 1
      end
    end
    
  end
  
  
  
  
end