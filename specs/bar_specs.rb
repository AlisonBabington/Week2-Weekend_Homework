require('minitest/autorun')
require('minitest/rg')

require_relative('../bar.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../drinks.rb')

class BarTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Martini", 8.30)
    @drink2 = Drink.new("Picpoul", 6.00)
    @drink3 = Drink.new("Mojito", 7.50)
    @drinks = [@drink1, @drink2, @drink3]

    @Guest1 = Guest.new("Mike", 19, 200, "Purple Rain", "Member")
    @Guest2 = Guest.new("Dill", 17, 21, "Livin' on a Prayer", "Guest")

    @Room1 = Room.new("Purple Room", [@Song1, @Song2],
      [@Guest1, @Guest2, @Guest3, @Guest4, @Guest5], 5, @Bar1)

    @Bar1 = Bar.new("Purple Room Bar", 200.00, [@drink1, @drink2])
   end

    def test_bar_has_name
      assert_equal("Purple Room Bar", @Bar1.name)
    end

    def test_bar_has_till
      assert_equal(200, @Bar1.till)
    end

    def test_bar_has_drinks
      assert_equal(2, @Bar1.drinks.count)
    end

    def test_bar_takes_money
      @Bar1.take_money(@drink1, @Bar1)
      assert_equal(208.30, @Bar1.till)
    end

    def test_bar_checks_age
      actual = @Bar1.checks_age(@Guest1)
      assert_equal(true, actual)
    end

    def test_bar_serves_customer
      actual = @Bar1.serve_guest(@drink1, @Bar1, @Guest1)
      assert_equal(191.70, @Guest1.wallet)
    end

    def test_bar_serves_members
       @Bar1.serve_members(@drink1,@Bar1, @Guest1)
       assert_equal(4.15, @Guest1.tab)
    end

    def test_bar_takes_tab
      @Bar1.serve_members(@drink1,@Bar1, @Guest1)
      @Bar1.serve_members(@drink1,@Bar1, @Guest1)
      @Bar1.paid_tab(@Guest1)
      assert_equal(0, @Guest1.tab)
    end
  end
