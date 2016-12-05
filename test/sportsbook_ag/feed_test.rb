require 'test_helper'

class SportsbookAg::Feed::Test < ActiveSupport::TestCase
  test 'loads games' do
    assert_equal nfl.games.count, 14
  end

  test 'loads odds for a game' do
    game = nfl.games.first
    assert_equal game.home, 'Jacksonville Jaguars'
    assert_equal game.visitor, 'Denver Broncos'

    assert_equal game.home_moneyline.odds, +160
    assert_nil   game.home_moneyline.spread
    assert_equal game.home_moneyline.type, :moneyline

    assert_equal game.visitor_spread.odds, -110
    assert_equal game.visitor_spread.spread, -3.5
    assert_equal game.visitor_spread.type, :spread

    assert_equal game.total, 39
    assert_equal game.over.odds, -110
  end
end
