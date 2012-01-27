require 'space'
require 'car'
require 'parking_lot'
require 'test/unit'

class ParkingLotTest < Test::Unit::TestCase
  
  def test_new_lot_is_not_full
    assert_equal false, ParkingLot.new.is_full?
  end
  
  def test_when_all_spaces_filled_then_lot_is_full
    lot = ParkingLot.new.park_car(Car.new(1)).park_car(Car.new(2))
    assert_equal true, lot.is_full?
  end
  
  def test_retrieve_car_from_lot
    car = Car.new(1)
    lot = ParkingLot.new.park_car(car).park_car(Car.new(2))
    
    assert_equal car, lot.retrieve_car(car)
  end
  
  def test_attempt_to_retrieve_car_not_in_lot_throws_error
    assert_raise RuntimeError do
      lot = ParkingLot.new.park_car(Car.new(1)).park_car(Car.new(2))
      lot.retrieve_car(Car.new(3))
    end
  end
  
  def test_should_raise_error_when_trying_to_park_a_car_when_lot_is_full
    assert_raise RuntimeError do
      ParkingLot.new.park_car(Car.new(1)).park_car(Car.new(2)).park_car(Car.new(3))
    end
  end
  
end