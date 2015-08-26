class PlayTypeError < StandardError 
end

class RPSGame 
  attr_accessor :play, :computer_play

  def self.valid_play?(play)
    [:rock, :paper, :scissors].include?(play)
  end

  def initialize(play)
    @play = play
    # raise PlayTypeError if ![:rock, :paper, :scissor].include?(play)
    raise PlayTypeError if !RPSGame.valid_play?(@play)
    @computer_play = [:rock, :paper, :scissors].sample
  end

  def won?
    (self.play == beats_rock && self.computer_play == :rock) ||
    (self.play == beats_scissors && self.computer_play == :scissors) || 
    (self.play == beats_paper && self.computer_play == :paper)
  end

  def win_with(play)
    self.play == send("beats_#{play.to_sym}") && self.computer_play == play
  end

  def tied?
    self.play == self.computer_play
  end

  def lost?
    !self.won? && !self.tied?
  end

# helper methods 
  def beats_rock
    :paper
  end

  def beats_scissors
    :rock
  end

  def beats_paper
    :scissors
  end

end
