require 'base_unit'

class Volume
  include BaseUnit
  
  attr_reader :teaspoons
  
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
  
  def base_unit
    Volume.teaspoon
  end 
  
  def calculate_amount_of_base_units(amount)
    amount * @teaspoons
  end
  
  
end