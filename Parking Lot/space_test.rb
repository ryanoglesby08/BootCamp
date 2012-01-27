require 'test/unit'
require 'space'
require 'car'

class SpaceTest < Test::Unit::TestCase
  def test_new_space_is_empty
    assert Space.new.is_empty?
  end
  
  def test_when_car_added_space_is_no_longer_empty
    assert !Space.new.add_car(Car.new(1)).is_empty?
  end
  
  def test_space_should_have_a_specific_car
    car = Car.new(1)
    
    assert Space.new.add_car(car).contains?(car)
  end
  
  def test_space_does_not_contain_the_wrong_car
    assert_equal false, Space.new.add_car(Car.new(1)).contains?(Car.new(2))
  end
  
  def test_space_throws_exception_when_full_and_add_is_called
    assert_raise RuntimeError do
      Space.new.add_car(Car.new(1)).add_car(Car.new(2))
    end
  end
  
  def test_space_should_be_empty_after_car_is_removed
    assert Space.new.add_car(Car.new(1)).remove_car.is_empty?
  end
  
end