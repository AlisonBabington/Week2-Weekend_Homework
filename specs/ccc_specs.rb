require('minitest/autorun')
require('minitest/rg')

require_relative('../ccc.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')

class CCCTest < MiniTest::Test

  def setup
    @Song1 = Song.new("Purple Rain", "Prince")
    @Song2 = Song.new("Just a Girl", "No Doubt")
    @Song3 = Song.new("Love will tear us apart", "Joy Division")
    @Song4 = Song.new("I will always love you", "Whitney Houston")

    @Guest1 = Guest.new("Mike", 19, 200, "Purple Rain", "Member")
    @Guest2 = Guest.new("Elsie", 14, 50, "Shake it Off", "Guest")

    @Room1 = Room.new("Purple Room", [@Song1, @Song2], [], 5, " ")
    @Room2 = Room.new("Red Room", [@Song1, @Song2], [] ,6, " ")
    @Room3 = Room.new("Blue Room", [@Song3, @Song4], [], 5, " ")

    @CCC = CCC.new("CodeClan Bar", [@Room1, @Room2], 10, 300,
    [@Guest1], 60)
  end

  def test_ccc_has_name
    assert_equal("CodeClan Bar", @CCC.name)
  end

  def test_ccc_has_rooms
    assert_equal(2, @CCC.rooms.count)
  end

  def test_ccc_has_entry_fee
    assert_equal(10, @CCC.entry_fee)
  end

  def test_ccc_has_till
    assert_equal(300, @CCC.till)
  end

  def test_ccc_has_new_rooms
    @CCC.new_room_add(@Room3)
    assert_equal(3, @CCC.rooms.count)
  end

  def test_ccc_has_new_guest
    @CCC.new_guest_add(@Guest2)
    assert_equal(2, @CCC.guests.count)
  end

  def test_ccc_charge_entry_fee
    @CCC.charge_entry(@Guest1, @Guest1.wallet, @CCC)
    actual = @CCC.till
    assert_equal(310 ,actual)
  end

end
