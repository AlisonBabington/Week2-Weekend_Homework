

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



end
