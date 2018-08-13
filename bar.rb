class Bar

  attr_reader :name, :drinks
  attr_accessor :till

def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks || []
  end

  def take_money(drink, bar)
    @till += drink.price
  end

  def checks_age(guest)
    if guest.age >= 18
      return true
    end
    return false
  end

  def serve_guest(drink, bar, guest)
    if bar.checks_age(guest) == false
      return "Sorry, you're too young to buy a drink"
    else guest.buy_drink(bar,drink)
    end
  end

  def serve_members(drink, bar,guest)
    if (guest.member_status = "member" &&
      bar,checks_age(guest) == true)
      guest.member_tab_drink(bar, drink)
    end
  end

  def paid_tab(guest)
    guest.pay_tab
    @till += guest.tab
    guest.tab = 0
  end


end
