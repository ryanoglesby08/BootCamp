class VolumeConversion
  TSP_PER_TBSP = 3
  TBSP_PER_OZ = 2
  OZ_PER_CUP = 8
  
  def self.tbsp_to_tsp(tbsp)
    tbsp * TSP_PER_TBSP
  end
  
  def self.oz_to_tsp(oz)
    tbsp = oz * TBSP_PER_OZ
    VolumeConversion.tbsp_to_tsp(tbsp)
  end
  
  def self.cups_to_tsp(cups)
    oz = cups * OZ_PER_CUP
    VolumeConversion.oz_to_tsp(oz)
  end
  
end