class Space
  
  def initialize
    @car = nil
  end
  
  def is_empty?
    @car == nil
  end
  
  def contains?(car)
    return false unless @car.name == car.name
    return true
  end
  
  def add_car(car)
    raise "Space is already full!" if !@car.nil?
    
    @car = car
    
    return self
  end
  
  def remove_car
    @car = nil
    return self
  end
  
end