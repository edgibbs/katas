require 'spec'
require File.join(File.dirname(__FILE__), '../lib/soccer_league_reader.rb')

describe SoccerLeagueReader do
  
  context "Reading in 2001/2 season file" do
    
    it "should return Manchester United as the team with the smallest diference in goals" do
      soccer_reader = SoccerLeagueReader.new
      soccer_reader.smallest_goal_difference.should == "Aston_Villa"
    end
    
  end



end