require 'test/unit'
require 'chance'

class ChanceTest < Test::Unit::TestCase
  def get_chance(probability)
    Chance.new(probability)
  end
  
  def test_should_happen   
    assert_equal get_chance(0.5), get_chance(0.5)    
    assert_equal get_chance(0.25), get_chance(0.25)
  end
  
  def test_should_not_happen
    assert_equal get_chance(0.5), get_chance(0.5).not
    assert_equal get_chance(0.75), get_chance(0.25).not
  end 
  
  def test_should_not_be_equal
    assert_not_equal get_chance(0.25), nil
    assert_not_equal get_chance(0.25), "Not a chance object"
  end
  
  def test_should_do_and
    assert_equal get_chance(0.25), get_chance(0.50).and(get_chance(0.50))
    assert_equal get_chance(0.03125), get_chance(0.25).and(get_chance(0.50)).and(get_chance(0.25))
  end
  
  def test_should_do_or
    assert_equal get_chance(0.50), get_chance(0.25).or(get_chance(0.25))
    assert_equal get_chance(1.0), get_chance(0.25).or(get_chance(0.50)).or(get_chance(0.25))
  end  
  
  def test_should_do_xor
    assert_equal get_chance(0.4375), get_chance(0.25).xor(get_chance(0.25))
  end
  
  def test_should_add_chances
    assert_equal get_chance(0.70), get_chance(0.30) + get_chance(0.40)
  end
  
  def test_should_subtract_chances
    assert_equal get_chance(0.25), get_chance(0.50) - get_chance(0.25)
  end
  
  def test_should_multiply_chances
    assert_equal get_chance(0.0625), get_chance(0.25) * get_chance(0.25)
  end
  
  def test_should_get_guaranteed_chance
    assert_equal get_chance(1), Chance.guaranteed_chance
  end
  
end