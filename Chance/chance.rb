class Chance
  attr_accessor :probability
  
  def initialize(probability)
    @probability = probability
  end
  
  def ==(other)
    if other.nil? || !other.is_a?(Chance)
      return false
    end
      
    @probability == other.probability
  end
  
  def not
    Chance.new(1-probability)
  end
end