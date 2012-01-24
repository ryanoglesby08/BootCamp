require 'test/unit'
require 'chance'

class ChanceTest < Test::Unit::TestCase
  def test_should_happen    
    assert_equal Chance.new(0.5), Chance.new(0.5)    
    assert_equal Chance.new(0.25), Chance.new(0.25)
  end
  
  def test_should_not_happen
    assert_equal Chance.new(0.5), Chance.new(0.5).not
    assert_equal Chance.new(0.75), Chance.new(0.25).not
  end 
  
  def test_should_not_be_equal
    assert_not_equal Chance.new(0.25), nil
    assert_not_equal Chance.new(0.25), "Not a chance object"
  end
     
end