class LengthConversion
  INCHES_PER_FOOT = 12
  FEET_PER_YARD = 3
  YARDS_PER_MILE = 1760
  
  def self.feet_to_inches(feet)
    feet * INCHES_PER_FOOT
  end
  
  def self.yards_to_inches(yards)
    feet = yards * FEET_PER_YARD
    LengthConversion.feet_to_inches(feet)
  end
  
  def self.miles_to_inches(miles)
    yards = miles * YARDS_PER_MILE
    LengthConversion.yards_to_inches(yards)
  end
  
end