require 'quantity'

class ArithmeticQuantity < Quantity
  def initialize(amount, unit)
    super(amount,unit)
  end
  
  def +(other)
    validate_unit_type(other)
    
    Quantity.new(unit.add(self.amount_of_base_units, other.amount_of_base_units), @unit.base_unit)
  end
  
end