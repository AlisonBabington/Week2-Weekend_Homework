class CCC

  attr_reader :name
  attr_accessor :rooms, :entry_fee, :till, :guests, :membership_fee

  def initialize(name, rooms, entry_fee, till, guests, membership_fee)
    @name = name
    @rooms = rooms || []
    @entry_fee = entry_fee
    @membership_fee = membership_fee
    @till = till
    @guests = guests || []
  end

  def new_room_add(room)
    @rooms << room
  end

  def new_guest_add(guest)
    @guests << guest
  end

  def charge_entry(guest,wallet,club)
    if  guest.afford_entry?(club, @entry_fee) == true
      guest.entry_pay(club, @entry_fee)
      @till += @entry_fee
    else
      return false
    end
  end

  def charge_membership(guest,wallet)
  end


end
