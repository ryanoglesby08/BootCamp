require 'parking_lot'

class Attendent
  
  def initialize(parking_lot, threshold_percent = 100)
    @parking_lot = parking_lot
    @parking_lot.add_observer(self)
    @lot_too_full = false
    @threshold_percent = threshold_percent
  end
  
  def update(total_spaces, available_spaces)
    if ((total_spaces - available_spaces).to_f / total_spaces.to_f) * 100 >= @threshold_percent
      @lot_too_full = true
    else
      @lot_too_full = false
    end
  end
  
  def park_car(car)
    if @lot_too_full == true
      raise 'Lot is too full!'
    else
      @parking_lot.park_car(car)
    end
  end
  
  def retrieve_car(car)
    @parking_lot.retrieve_car(car)
  end
  
end