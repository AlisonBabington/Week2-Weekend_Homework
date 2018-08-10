require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')

class GuestTest < MiniTest::Test

  def setup
    @Guest1 = Guest.new("Mike", 19, 200, "Purple Rain")
  end

  def test_guest_has_name
    assert_equal("Mike", @Guest1.name)
  end

  def test_guest_has_age
    assert_equal(19, @Guest1.age)
  end

  

end
