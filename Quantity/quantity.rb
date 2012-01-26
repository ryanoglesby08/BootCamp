class Quantity
  attr_reader :amount_of_base_units, :quantity_type
  
  def initialize(amount, unit)
    @amount_of_base_units = amount * unit.base_units
    @quantity_type = unit.class
  end
  
  def ==(other)
    if self.quantity_type != other.quantity_type
      raise RuntimeError, "Incompatible types. Cannot compare."
    end
    
    self.amount_of_base_units == other.amount_of_base_units
  end
  
  private
  
  def calculate_amount_of_base_units(amount, unit)
    amount * unit.base_units
  end
  
end