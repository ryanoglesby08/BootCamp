require 'quantity'
require 'length_conversion'

class Length < Quantity  
  def initialize(amount,unit)
    super(amount,unit)
  end
  
  def get_base_unit_amount
    case unit
      when "in" then @amount
      when "ft" then LengthConversion.feet_to_inches(@amount)
      when "yd" then LengthConversion.yards_to_inches(@amount)
      when "mi" then LengthConversion.miles_to_inches(@amount)
      else nil
    end
  end
  
end