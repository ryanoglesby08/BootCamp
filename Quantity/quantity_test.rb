require 'test/unit'
require 'quantity'
require 'length'
require 'volume'

class QuantityTest < Test::Unit::TestCase  
  
  def get_quantity(amount, unit)
    Quantity.new(amount,unit)
  end
  
  def test_equality
    assert_equal get_quantity(9, Length.inch), get_quantity(9, Length.inch)
    assert_equal get_quantity(9, Length.inch), get_quantity(9.0, Length.inch)
        
    assert_equal get_quantity(12, Length.inch), get_quantity(1, Length.foot)
    assert_equal get_quantity(3, Length.foot), get_quantity(1, Length.yard)
    assert_equal get_quantity(1760, Length.yard), get_quantity(1, Length.mile)
    
    assert_equal get_quantity(1, Volume.tablespoon), get_quantity(3, Volume.teaspoon)
    assert_equal get_quantity(2, Volume.tablespoon), get_quantity(1, Volume.ounce)
    assert_equal get_quantity(8, Volume.ounce), get_quantity(1, Volume.cup)
  end
  
  def test_not_equals
    assert_not_equal get_quantity(9, Length.foot), get_quantity(12, Length.yard)
    
    assert_not_equal get_quantity(9, Volume.teaspoon), get_quantity(12, Volume.cup)
  end
  
  def test_should_throw_exception_for_type_mismatch
    assert_raise RuntimeError do
       get_quantity(9, Length.foot)== get_quantity(9, Volume.teaspoon)
     end
    assert_raise RuntimeError do
      get_quantity(9, Length.foot) == Object.new    
    end
    assert_raise RuntimeError do
      get_quantity(2, Length.foot) + get_quantity(3, Volume.teaspoon)
    end
  end
  
  def test_addition
    assert_equal get_quantity(2, Length.inch), get_quantity(1, Length.inch) + get_quantity(1, Length.inch)
    assert_equal get_quantity(2, Volume.teaspoon), get_quantity(1, Volume.teaspoon) + get_quantity(1, Volume.teaspoon)
  end
end