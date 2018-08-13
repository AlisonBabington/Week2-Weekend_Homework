require('minitest/autorun')
require('minitest/rg')

require_relative('../drink.rb')

class DrinkTest < MiniTest::Test

def setup
  @drink = Drink.new("Mojito", 8.00)
end

def test_drink_has_name
  assert_equal("Mojito", @drink.name)
end

def test_drink_has_price
  assert_equal(8.00, @drink.price)
end


end
