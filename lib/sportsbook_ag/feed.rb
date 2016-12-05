require 'sportsbook_ag/feed/nfl'
require 'sportsbook_ag/game'
require 'sportsbook_ag/line'
require 'open-uri'

module SportsbookAg
  module Feed
    BASE_URL = 'https://www.sportsbook.ag/rss/'

    ::ActiveSupport::Inflector.inflections do |inflect|
      inflect.acronym 'NFL'
    end
  end
end
