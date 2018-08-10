class Room

  attr_reader :room_name, :songs
  attr_accessor :guests, :room_size

  def initialize(room_name, songs, guests, room_size)
    @room_name = room_name
    @songs = songs || []
    @guests = guests || []
    @room_size = room_size
  end

  def add_song(song)
    @songs << song
  end

  def check_guest_in(guest)
    @guests << guest
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

  def check_full?
    @guests.count < @room_size
  end

  def play_song(song, title)
    return "Get ready, #{song.title} is starting... "
  end


end
