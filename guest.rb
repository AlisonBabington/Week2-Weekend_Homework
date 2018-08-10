

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

  # def choose_song(room, songs, song)
  #   if room.songs.include?(song) == true
  #     return "Hooray!"
  #   else
  #     return "Sorry, we do not have that song, please feel free to suggest
  #     it is added to our list"
  #   end
  # end



end
