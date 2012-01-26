class Volume
  attr_accessor :teaspoons
  
  def initialize(teaspoons)
    @teaspoons = teaspoons
  end
  
  def self.teaspoon
    Volume.new(1)
  end
  
  def self.tablespoon
    Volume.new(3)
  end
  
  def self.ounce
    Volume.new(6)
  end
  
  def self.cup
    Volume.new(48)
  end
  
  def base_units
    @teaspoons
  end
  
end