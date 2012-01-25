require 'test/unit'
require 'quantity'

class QuantityTest < Test::Unit::TestCase
  def get_quantity(amount,unit)
    Quantity.new(amount,unit)
  end
  
  def test_equality
    assert_equal get_quantity(9,"in"), get_quantity(9,"in")
    assert_equal get_quantity(9,"in"), get_quantity(9.0,"in")
        
    assert_equal get_quantity(12,"in"), get_quantity(1,"ft")
    assert_equal get_quantity(3, "ft"), get_quantity(1, "yd")
    assert_equal get_quantity(1760, "yd"), get_quantity(1, "mi")
  end
  
  def test_not_equals
    assert_not_equal get_quantity(9,"ft"), "string"
    assert_not_equal get_quantity(9,"ft"), nil
  end
  
  def test_get_base_unit_amount
    assert_equal 5, get_quantity(5,"in").get_base_unit_amount
    assert_equal 24, get_quantity(2, "ft").get_base_unit_amount
  end
  
end