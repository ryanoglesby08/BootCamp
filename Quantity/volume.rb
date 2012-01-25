require 'quantity'
require 'volume_conversion'

class Volume < Quantity
  def initialize(amount,unit)
    super(amount,unit)
  end
  
  def get_base_unit_amount
    case unit
      when "tsp"  then @amount
      when "tbsp" then VolumeConversion.tbsp_to_tsp(@amount)
      when "oz"   then VolumeConversion.oz_to_tsp(@amount)
      when "cups" then VolumeConversion.cups_to_tsp(@amount)
      else nil
    end
  end
  
end