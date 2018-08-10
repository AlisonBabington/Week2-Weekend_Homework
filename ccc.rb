class CCC

  attr_reader :name
  attr_accessor :rooms, :entry_fee, :till, :guests

  def initialize(name, rooms, entry_fee, till, guests)
    @name = name
    @rooms = rooms || []
    @entry_fee = entry_fee
    @till = till
    @guests = guests || []
  end

  def new_room_add(room)
    @rooms << room
  end

  def new_guest_add(guest)
    @guests << guest
  end
end
