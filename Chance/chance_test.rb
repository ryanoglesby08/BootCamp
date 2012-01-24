require 'test/unit'
require 'chance'

class ChanceTest < Test::Unit::TestCase
  def test_should_find_probability_of_flipping_heads_on_a_coin
   sides_on_a_coin = 2
    
    chance = Chance.new(sides_on_a_coin)
    
    assert_equal 0.5, chance.find_probability
  end
  
  def test_should_find_probability_of_not_getting_a_one_when_rolling_a_six_sided_die
    sides_on_a_die = 6
    
    chance = Chance.new(sides_on_a_die)
    
    assert_equal 5.fdiv(6), chance.find_not_probability    # 5 / 6 = .833333
  end
end