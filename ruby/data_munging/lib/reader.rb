require 'logger'

class Reader
  
  $LOG = Logger.new($stderr)
  
  def get_lines(filename)
    lines = []
    open(File.join(File.dirname(__FILE__), "../data/#{filename}")).each do |line|
      lines << line
    end
    lines
  end
  
  def get_good_lines(lines, matcher)
    good_lines = []
    lines.each do | line |
      if line =~ matcher
        good_lines << line
      end
    end
    good_lines
  end
  
end