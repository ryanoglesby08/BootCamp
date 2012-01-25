require 'quantity_conversion'

class Quantity
  attr_accessor :amount, :unit
  
  def initialize(amount,unit)
    @amount = amount
    @unit = unit
  end
  
  def ==(other)
    if !other.instance_of?(Quantity)
      return false
    end
    
    if @unit == other.unit
      return @amount == other.amount
    end
      
    get_base_unit_amount == other.get_base_unit_amount
  end
  
  def get_base_unit_amount
    case unit
      when "in" then @amount
      when "ft" then QuantityConversion.feet_to_inches(@amount)
      when "yd" then QuantityConversion.yards_to_inches(@amount)
      when "mi" then QuantityConversion.miles_to_inches(@amount)
      else nil
    end
  end
  
end