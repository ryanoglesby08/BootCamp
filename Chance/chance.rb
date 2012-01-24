class Chance
  attr_accessor :total_outcomes
  
  def initialize(total_outcomes)
    @total_outcomes = total_outcomes
  end
  
  def find_probability
    1.fdiv(@total_outcomes)
  end
  
  def find_not_probability
    (@total_outcomes-1).fdiv(@total_outcomes)
  end
end