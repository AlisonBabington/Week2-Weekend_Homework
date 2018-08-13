

class Guest

  attr_reader :name, :age, :favourite_song
  attr_accessor :wallet, :member_status, :tab

  def initialize(name, age, wallet,favourite_song, member_status)
    @name = name
    @age = age
    @wallet = wallet
    @favourite_song = favourite_song
    @member_status = member_status
    @tab = 0
  end

  def afford_entry?(club,entry_fee)
    @wallet >= club.entry_fee
  end

  def entry_pay(club,entry_fee)
    @wallet -= club.entry_fee
  end

  def fav_song_play(room)
    if room.songs.title.include?(@favourite_song)
      room.play_song(@favourite_song)
      return "Yay! I can sing my fav song"
    else
      return
        "Boo, they don't have my fav song"
    end
  end

  def buy_drink(bar,drink)
    @wallet -= drink.price
  end

  def afford_membership(club, membership_fee)
    @wallet>=club.membership_fee
  end

  def buy_membership(club, membership_fee)
    @wallet -= membership_fee
    @member_status = "member"
  end

  def member_tab_drink(bar,drink)
      membership_drinks = drink.price / 2
      @tab += membership_drinks
  end

  def pay_tab
    @wallet -= @tab
  end


end
