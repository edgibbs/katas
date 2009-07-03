require 'logger'

class SoccerLeagueReader
  
  $LOG = Logger.new($stderr)
  
  def initialize
    @team_stat_lines = []
    parse_file()
    @smallest_goal_difference_team = find_smallest_goal_difference()
  end
  
  def smallest_goal_difference
    @smallest_goal_difference_team
  end
  
private

  def parse_file
    lines = []
    open(File.join(File.dirname(__FILE__), '../data/football.dat')).each do |line|
      lines << line
    end
    
    lines.each do | line |
      if line.slice(4,5) =~ /\d./
        @team_stat_lines << line
      end
    end
  end
  
  def find_smallest_goal_difference
    goal_differences = build_team_hash()
    
    smallest_difference = goal_differences.values.sort.first
    smallest_difference_team = ""
    goal_differences.each do | team, difference |
      if smallest_difference == difference
        return team
      end
    end
  end
  
  def build_team_hash
    goal_differences = {}
    @team_stat_lines.each do | line |
      team_name = line.slice(7..22).strip
      goals_for = line.slice(43..44).strip.to_i
      goals_against = line.slice(50..51).strip.to_i
      difference = (goals_for - goals_against).abs
      goal_differences[team_name] = (goals_for - goals_against).abs
    end
    goal_differences
  end
  
end