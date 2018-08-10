require('minitest/autorun')
require('minitest/rg')

require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class RoomTest < MiniTest::Test

  def setup
    @Guest1 = Guest.new("Mike", 19, 200, "Purple Rain")
    @Guest2 = Guest.new("Elsie", 14, 50, "Shake it Off")
    @Guest3 = Guest.new("Eric", 14, 50, "Shake it Off")
    @Guest4 = Guest.new("Emma", 14, 50, "Shake it Off")
    @Guest5 = Guest.new("Oscar", 14, 50, "Shake it Off")

    @Song1 = Song.new("Purple Rain", "Prince")
    @Song2 = Song.new("Just a Girl", "No Doubt")
    @Song3 = Song.new("Uptown Girl", "Backstreet Boys")

    @Room1 = Room.new("Purple Room", [@Song1, @Song2],
    [@Guest1, @Guest2, @Guest3, @Guest4, @Guest5], 5)
    @Room2 = Room.new("Red Room", [@Song2, @Song3],[@Guest1, @Guest2], 5)
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
    @Room1.check_guest_out(@Guest1)
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
end
