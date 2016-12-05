module SportsbookAg
  module Feed
    class NFL
      FEED_NAME = 'nfl-football'

      attr_reader :_data, :_xml, :games, :updated_at

      def initialize(path = nil)
        @_xml = open(path || (BASE_URL + FEED_NAME)).read
        @updated_at = Time.now
        @_data = Hash.from_xml(_xml).deep_symbolize_keys!
        parse
      end

      private

      def parse
        parse_games
      end

      def parse_games
        @games = []
        _data[:rss][:channel][:item].each do |data|
          games << Game.new(data)
        end
      end
    end
  end
end
