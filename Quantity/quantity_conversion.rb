class QuantityConversion
  @@inches_per_foot = 12
  @@feet_per_yard = 3
  @@yards_per_mile = 1760
  
  def self.feet_to_inches(feet)
    feet * @@inches_per_foot
  end
  
  def self.yards_to_inches(yards)
    feet = yards * @@feet_per_yard
    QuantityConversion.feet_to_inches(feet)
  end
  
  def self.miles_to_inches(miles)
    yards = miles * @@yards_per_mile
    QuantityConversion.yards_to_inches(yards)
  end
  
end