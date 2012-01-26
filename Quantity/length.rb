require 'base_unit'

class Length
  include BaseUnit
  
  attr_reader :inches
  
  def initialize(inches)
    @inches = inches
  end
  
  def self.inch
    Length.new(1)
  end
  
  def self.foot
    Length.new(12)
  end
  
  def self.yard
    Length.new(36)
  end
  
  def self.mile
    Length.new(63360)
  end
  
  def base_unit
    Length.inch
  end
  
  def calculate_amount_of_base_units(amount)
    amount * @inches
  end
  
end