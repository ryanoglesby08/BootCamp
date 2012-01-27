require 'attendent'
require 'test/unit'

class AttendentTest < Test::Unit::TestCase
  
  def test_should_park_car
    assert Attendent.new(ParkingLot.new(1)).park_car(Car.new)
  end
    
  def test_attendent_should_retrieve_car
    car = Car.new
    parking_lot = ParkingLot.new(2).park_car(Car.new).park_car(car)
    assert_equal car, Attendent.new(parking_lot).retrieve_car(car)
  end
    
  def test_update_should_fail_with_bad_params
    parking_lot = ParkingLot.new(10)
    attendent = Attendent.new(parking_lot, 80.0)
    attendent.update(10, 2)
    
    assert_raise RuntimeError do
      attendent.park_car(Car.new)
    end
  end
    
  
  def test_should_raise_exception_when_lot_is_too_full_for_attendent
    parking_lot = ParkingLot.new(10)
        
    attendent = Attendent.new(parking_lot, 80.0)
        
    8.times do
      attendent.park_car(Car.new)
    end
        
    assert_raise RuntimeError do
      attendent.park_car(Car.new)
    end
  end
  
  def test_should_raise_exception_when_lot_is_too_full_for_attendent_again
    parking_lot = ParkingLot.new(10)
        
    attendent = Attendent.new(parking_lot, 80.0)
    
    car = Car.new
    attendent.park_car(car)    
        
    7.times do
      attendent.park_car(Car.new)
    end
    
    attendent.retrieve_car(car)
    
    attendent.park_car(Car.new)
        
    assert_raise RuntimeError do
      attendent.park_car(Car.new)
    end
  end
  
  
end