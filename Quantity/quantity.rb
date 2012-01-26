class Quantity
  attr_accessor :amount_of_base_unit, :quantity_type
  
  def initialize(amount,unit)
    @amount_of_base_unit = amount * unit.base_units
    @quantity_type = unit.class
  end
  
  def ==(other)
    if self.quantity_type != other.quantity_type
      raise "Incompatible types.  Cannot compare."
    end
    
    self.amount_of_base_unit == other.amount_of_base_unit
  end
  
end