require 'space'
require 'observer'

class ParkingLot
  include Observable
  
  def initialize(size)
    @spaces = []
    size.times do |index|
      @spaces[index] = Space.new
    end
    @available_spaces = @spaces.size
  end
  
  def park_car(car)
    raise "This lot is full!" if is_full?
    @spaces.each do |space|
      if space.is_empty?
        space.add_car(car)
        changed
        @available_spaces -= 1
        notify_observers(@spaces.size, @available_spaces)
        break
      end
    end
    
    return self
  end
  
  def retrieve_car(car)
    @spaces.each do |space|
      if space.contains?(car)
        space.remove_car
        changed
        @available_spaces += 1
        notify_observers(@spaces.size, @available_spaces)
        return car
      end
    end
    
    raise "That car is not parked in this lot!"
  end
  
  private
  def is_full?
    @spaces.each do |space|
      return false if space.is_empty?
    end
    
    return true
  end

end