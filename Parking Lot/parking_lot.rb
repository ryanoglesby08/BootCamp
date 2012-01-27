class ParkingLot
  def initialize(size)
    @spaces = []
    size.times do |index|
      @spaces[index] = Space.new
    end
  end
  
  def park_car(car)
    raise "This lot is full!" if is_full?
    @spaces.each do |space|
      if space.is_empty?
        space.add_car(car)
        break
      end
    end
    
    return self
  end
  
  def retrieve_car(car)
    @spaces.each do |space|
      if space.contains?(car)
        space.remove_car
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