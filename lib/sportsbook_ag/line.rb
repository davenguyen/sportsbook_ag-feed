module SportsbookAg
  module Feed
    class Line
      attr_reader :odds, :spread, :type

      def initialize(type, odds, spread = nil)
        @odds = odds
        @spread = spread
        @type = type
      end
    end
  end
end
