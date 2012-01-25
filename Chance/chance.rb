class Chance
  attr_accessor :probability
  
  def initialize(probability)
    @probability = probability
  end
  
  def self.guaranteed_chance
    Chance.new(1)
  end
  
  def ==(other)
    if other.nil? || !other.is_a?(Chance)
      return false
    end
    
    @probability == other.probability
  end
  
  def +(other)
    Chance.new(self.probability + other.probability)
  end
  
  def -(other)
    Chance.new(self.probability - other.probability)
  end
  
  def *(other)
    Chance.new(self.probability * other.probability)
  end
  
  def not
    Chance.guaranteed_chance - self
  end
  
  def and(other)
    self * other
  end
  
  def or(other)
    self + other
  end
  
  def xor(other)
    self.or(other) - self.and(other)
  end
  
end