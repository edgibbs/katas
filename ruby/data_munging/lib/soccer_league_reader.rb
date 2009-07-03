require 'logger'

class SoccerLeagueReader
  
    $LOG = Logger.new($stderr)
  
  def smallest_goal_difference
    parse_file()
  end
  
private

  def parse_file
    lines = []
    open(File.join(File.dirname(__FILE__), '../data/football.dat')).each do |line|
      lines << line
    end
    
    relevant_lines = []
    lines.each do | line |
      $LOG.debug("#{line.slice(4..5)}")
      if line.slice(4,5) =~ /\d./
        relevant_lines << line
      end
    end
    
    team_name = find_smallest_goal_difference(relevant_lines)
    return team_name
  end
  
  def find_smallest_goal_difference(lines)
    goal_differences = {}
    lines.each do | line |
      team_name = line.slice(7..22).strip
      goals_for = line.slice(43..44).strip.to_i
      goals_against = line.slice(50..51).strip.to_i
      difference = (goals_for - goals_against).abs
      goal_differences[team_name] = (goals_for - goals_against).abs
    end
    
    smallest_difference = goal_differences.values.sort.first
    smallest_difference_team = ""
    goal_differences.each do | team, difference |
      if smallest_difference == difference
        smallest_difference_team = team
      end
    end
    return smallest_difference_team

  end
  
end