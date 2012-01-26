require 'base_unit'
class Temperature
  include BaseUnit
  
  attr_reader :am_i_c
  
  def initialize(am_i_c)
    @am_i_c=am_i_c
  end
  
  def self.c
    Temperature.new(true)
  end
  
  def self.f
    Temperature.new(false)
  end

  def base_unit
    Temperature.c
  end
  
  def calculate_amount_of_base_units(amount)
    if !@am_i_c
      return ((amount-32)*(5.0/9.0)).to_i
    end
    return amount
  end

end
