require 'test/unit'
require 'square'

class SquareTest < Test::Unit::TestCase
  def test_should_get_area_of_square
    side = 2
    
    square = Square.new(side)
    
    assert_equal 4, square.area
  end
end