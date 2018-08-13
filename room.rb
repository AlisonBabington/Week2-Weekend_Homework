class Room

  attr_reader :room_name, :songs, :bar
  attr_accessor :guests, :room_size

  def initialize(room_name, songs, guests, room_size, bar)
    @room_name = room_name
    @songs = songs 
    @guests = guests || []
    @room_size = room_size
    @bar = bar
  end

  def add_song(song)
    @songs << song
  end

  def check_guest_in(guest)
    @guests << guest
  end

  def check_guest_out(guest, bar)
    if guest.member_status = "member"
    bar.paid_tab(guest)
    @guests.delete(guest)
    end
    @guests.delete(guest)
  end

  def check_full?
    @guests.count < @room_size
  end

  def play_song(song)
    if @songs.include?(song) == true
      return "Get ready, #{song.title} is starting... "
    else
     return "Sorry, we do not have that song, please feel free to suggest
     it is added to our list"
    end
  end



end
