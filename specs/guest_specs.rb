require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../ccc.rb')
require_relative('../room.rb')

class GuestTest < MiniTest::Test

  def setup
    @CCC = CCC.new("CodeClan Bar", [@Room1, @Room2], 10, 300,
    [@Guest1])

    @Room1 = Room.new("Purple Room", [@Song1, @Song2],
    [@Guest1, @Guest2, @Guest3, @Guest4, @Guest5], 5)

    @Song1 = Song.new("Purple Rain", "Prince")
    @Song2 = Song.new("Just a Girl", "No Doubt")
    @Song3 = Song.new("Uptown Girl", "Backstreet Boys")

    @Guest1 = Guest.new("Mike", 19, 200, "Purple Rain")
    @Guest2 = Guest.new("Dill", 17, 8, "Livin' on a Prayer")
  end

  def test_guest_has_name
    assert_equal("Mike", @Guest1.name)
  end

  def test_guest_has_age
    assert_equal(19, @Guest1.age)
  end

  def test_guest_has_wallet
    assert_equal(200, @Guest1.wallet)
  end

  def test_guest_has_favourite_song
    assert_equal("Purple Rain", @Guest1.favourite_song)
  end

  def test_guest_can_pay_entry
    actual1 = @Guest1.afford_entry?(@CCC, @CCC.entry_fee)
    actual2 = @Guest2.afford_entry?(@CCC, @CCC.entry_fee)
    assert_equal(true, actual1)
    assert_equal(false, actual2)
  end

  def test_entry_pay
    @Guest1.entry_pay(@CCC, @CCC.entry_fee)
    assert_equal(190, @Guest1.wallet)
  end

  


end
