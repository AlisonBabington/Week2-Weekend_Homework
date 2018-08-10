

class Guest

  attr_reader :name, :age, :favourite_song
  attr_accessor :wallet

  def initialize(name, age, wallet,favourite_song)
    @name = name
    @age = age
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def afford_entry?(club,entry_fee)
    @wallet >= club.entry_fee
  end

  def entry_pay(club,entry_fee)
    @wallet -= club.entry_fee
  end

  def fav_song_play(room)
    if room.songs.include?(@favourite_song)
      room.play_song(@favourite_song)
      return "Yay! I can sing my fav song"
    else
      return
        "Boo, they don't have my fav song"
    end
  end


end
