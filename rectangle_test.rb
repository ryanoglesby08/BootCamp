require 'test/unit'
require 'rectangle'

class RectangleTest < Test::Unit::TestCase
  def test_should_get_area_of_rectangle
    length = 2
    height = 3
    
    rectangle = Rectangle.new(length,height)
    
    expected_area = 6
    actual_area = rectangle.area
    
    assert_equal expected_area, actual_area
  end
end