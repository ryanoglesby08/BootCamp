module BaseUnit
  def base_unit
    raise "Must implement base unit method!!!!"
  end
  
  def calculate_amount_of_base_units(amount)
    raise "Must implement calculcate amount of base units method!!!!"
  end
  
  def add(amount, other_amount)
    amount + other_amount
  end
  
end