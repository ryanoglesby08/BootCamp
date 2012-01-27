require 'space'
require 'car'
require 'parking_lot'
require 'test/unit'

class ParkingLotTest < Test::Unit::TestCase
  
  def test_retrieve_car_from_lot
    car = Car.new
    lot = ParkingLot.new(2).park_car(car).park_car(Car.new)
    
    assert_equal car, lot.retrieve_car(car)
  end
  
  def test_attempt_to_retrieve_car_not_in_lot_throws_error
    assert_raise RuntimeError do
      lot = ParkingLot.new(2).park_car(Car.new).park_car(Car.new)
      lot.retrieve_car(Car.new)
    end
  end
  
  def test_should_raise_error_when_trying_to_park_a_car_when_lot_is_full
    assert_raise RuntimeError do
      ParkingLot.new(2).park_car(Car.new).park_car(Car.new).park_car(Car.new)
    end
  end
  
  def test_we_define_lot_size
    lot = ParkingLot.new(1)
    assert_raise RuntimeError do
      lot.park_car(Car.new).park_car(Car.new)
    end
  end
  
end