require 'test/unit'
require 'quantity'
require 'length'
require 'volume'

class QuantityTest < Test::Unit::TestCase  
  def get_length(amount,unit)
    Length.new(amount,unit)
  end
  
  def get_volume(amount,unit)
    Volume.new(amount,unit)
  end
  
  def test_equality
    assert_equal get_length(9,"in"), get_length(9,"in")
    assert_equal get_length(9,"in"), get_length(9.0,"in")
        
    assert_equal get_length(12,"in"), get_length(1,"ft")
    assert_equal get_length(3, "ft"), get_length(1, "yd")
    assert_equal get_length(1760, "yd"), get_length(1, "mi")
    
    assert_equal get_volume(1, "tbsp"), get_volume(3, "tsp")
    assert_equal get_volume(2, "tbsp"), get_volume(1, "oz")
    assert_equal get_volume(8, "oz"), get_volume(1, "cups")
  end
  
  def test_not_equals
    assert_not_equal get_length(9,"ft"), get_length(12, "yd")
    
    assert_not_equal get_volume(9,"tsp"), get_volume(12,"cups")
  end
  
  def test_should_throw_exception_for_type_mismatch
    assert_raise RuntimeError do
      assert_equal get_length(9,"ft"), get_volume(9,"tsp")
    end
  end
  
  def test_get_base_unit_amount
    assert_equal 5, get_length(5,"in").get_base_unit_amount
    assert_equal 24, get_length(2, "ft").get_base_unit_amount
    assert_equal 36, get_length(1, "yd").get_base_unit_amount
    assert_equal 63360, get_length(1, "mi").get_base_unit_amount
    
    assert_equal 5, get_volume(5,"tsp").get_base_unit_amount
    assert_equal 6, get_volume(2, "tbsp").get_base_unit_amount
    assert_equal 6, get_volume(1, "oz").get_base_unit_amount
    assert_equal 48, get_volume(1, "cups").get_base_unit_amount
  end
  
end