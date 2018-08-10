require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class SongTest < MiniTest::Test

  def setup
    @Song1 = Song.new("Livin' on a Prayer", "Bon Jovi")
  end

  def test_song_has_name
    assert_equal("Livin' on a Prayer", @Song1.title)
  end

  def test_song_has_artist
    assert_equal("Bon Jovi", @Song1.artist)
  end
end
