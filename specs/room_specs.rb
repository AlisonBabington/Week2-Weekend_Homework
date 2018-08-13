require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../bar.rb')

class RoomTest < MiniTest::Test

  def setup
    @Guest1 = Guest.new("Mike", 19, 200.00, "Purple Rain", "member")
    @Guest2 = Guest.new("Elsie", 21, 50.00, "Shake it Off", "guest")
    @Guest3 = Guest.new("Eric", 14, 50.00, "Shake it Off", "member")
    @Guest4 = Guest.new("Emma", 14, 50.00, "Shake it Off", "guest")
    @Guest5 = Guest.new("Oscar", 14, 50.00, "Shake it Off", "guest")

    @Song1 = Song.new("Purple Rain", "Prince")
    @Song2 = Song.new("Just a Girl", "No Doubt")
    @Song3 = Song.new("Uptown Girl", "Backstreet Boys")

    @Room1 = Room.new("Purple Room", [@Songs],
    [@Guest1, @Guest2, @Guest3, @Guest4, @Guest5], 5, @Bar1)
    @Room2 = Room.new("Red Room", [@Song2, @Song3],[@Guest1, @Guest2], 5, @Bar1)

    @Bar1 = Bar.new("Purple Room Bar", 300.00, [@drink1, @drink2])
  end

  def test_room_has_name
    assert_equal("Purple Room", @Room1.room_name)
  end

  def test_room_has_songs
    assert_equal(2, @Room1.songs.count)
  end

  def test_room_gets_song
    @Room1.add_song(@Song3)
    actual = @Room1.songs.include?(@Song3)
    assert_equal(true, actual)
  end

  def test_check_guest_in
    @Room1.check_guest_in(@Guest1)
    actual = @Room1.guests.include?(@Guest1)
    assert_equal(true, actual)
  end

  def test_check_guest_out
    @Room1.check_guest_out(@Guest1, @Bar1)
    actual = @Room1.guests.include?(@Guest1)
    assert_equal(false, actual)
  end

  def test_check_room__full
    actual = @Room1.check_full?
    assert_equal(false, actual)
  end

  def test_check_room__not_full
    actual = @Room2.check_full?
    assert_equal(true, actual)
  end

  def test_room_play_song
    expected = "Get ready, Purple Rain is starting... "
    actual = @Room1.play_song(@Song1)
    assert_equal(expected, actual)
  end

  def test_playlist
    p @Room1.show_playlist
    assert_equal( )
  end
end
