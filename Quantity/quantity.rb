class Quantity
  attr_accessor :amount, :unit
  
  def initialize(amount,unit)
    @amount = amount
    @unit = unit
  end
  
  def ==(other)
    if !other.instance_of?(self.class)
      raise "Incompatible types.  Cannot compare."
    end
    
    if @unit == other.unit
      return @amount == other.amount
    end
            
    get_base_unit_amount == other.get_base_unit_amount
  end
  
end