class Quantity
  attr_reader :amount_of_base_units, :unit
  
  def initialize(amount, unit)
    @amount_of_base_units = unit.calculate_amount_of_base_units(amount)
    @unit = unit
  end
  
  def ==(other)
    validate_unit_type(other)
    
    self.amount_of_base_units == other.amount_of_base_units
  end
  
  def +(other)
    validate_unit_type(other)

    Quantity.new(self.amount_of_base_units + other.amount_of_base_units, @unit.base_unit)
  end
  
  private
  
  
  def validate_unit_type(other)
    if !other.is_a?(Quantity) || self.unit.class != other.unit.class
      raise RuntimeError, "Incompatible types. Cannot compare."
    end
  end
  
end