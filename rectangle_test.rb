require 'test/unit'
require 'rectangle'

class RectangleTest < Test::Unit::TestCase
  def test_should_get_area_of_rectangle
    length = 2
    height = 3
    
    rectangle = Rectangle.new(length,height)
    
    assert_equal 6, rectangle.area
  end
end