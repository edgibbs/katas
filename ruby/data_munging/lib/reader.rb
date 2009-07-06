require 'logger'


class Reader
  
    $LOG = Logger.new($stderr)
  
  def get_lines(filename)
    lines = []
    open(File.join(File.dirname(__FILE__), "../data/#{filename}")).each do |line|
      lines << line
      $LOG.debug("In get_lines_loop")
    end
    lines
  end
  
  def get_good_lines(lines, matcher)
    good_lines = []
    lines.each do | line |
      # $LOG.debug("Actual line = #{line}")
      if line =~ matcher
        $LOG.debug("Matched line = #{line}")
        good_lines << line
      end
    end
    good_lines
  end
  
end