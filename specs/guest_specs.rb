require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../ccc.rb')
require_relative('../room.rb')
require_relative('../bar.rb')
require_relative('../drinks.rb')

class GuestTest < MiniTest::Test

  def setup
    @CCC = CCC.new("CodeClan Bar", [@Room1, @Room2], 10, 300,
    [@Guest1], 60)

    @Room1 = Room.new("Purple Room", [@Song1, @Song2],
    [@Guest1, @Guest2, @Guest3, @Guest4, @Guest5], 5, @Bar1)

    @Bar1 = Bar.new("Purple Room Bar", 300.00, [@drink1, @drink2])

    @drink1 = Drink.new("Mojito", 8.00)

    @Song1 = Song.new("Purple Rain", "Prince")
    @Song2 = Song.new("Just a Girl", "No Doubt")
    @Song3 = Song.new("Uptown Girl", "Backstreet Boys")

    @Guest1 = Guest.new("Mike", 19, 200.00, "Purple Rain", "member")
    @Guest2 = Guest.new("Dill", 17, 8.00, "Livin' on a Prayer", "guest")
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

  def test_play_fav_song
    actual = @Guest1.fav_song_play(@Room1)
    assert_equal("Yay! I can sing my fav song", actual)
  end

  def test_guest_can_buy_drink
    @Guest1.buy_drink(@Bar1, @drink1)
    assert_equal(192.00, @Guest1.wallet)
  end

  def test_guest_pay_membership
    actual = @Guest1.afford_entry?(@CCC,@CCC.membership_fee)
    assert_equal(true, actual)
  end

  def test_guest_has_membership
    @Guest1.buy_membership(@CCC,@CCC.membership_fee)
    assert_equal(140.00, @Guest1.wallet)
    assert_equal("member", @Guest1.member_status)
  end

  def test_member_tab
    @Guest1.member_tab_drink(@Bar1, @drink1)
    assert_equal(4.00, @Guest1.tab)
  end

  def test_member_pay_tab
    @Guest1.member_tab_drink(@Bar1, @drink1)
    @Guest1.pay_tab
    assert_equal(196, @Guest1.wallet)
  end
end
