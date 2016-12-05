module SportsbookAg
  module Feed
    class Game
      attr_reader :_data, :home, :home_moneyline, :home_spread, :over, :time,
        :total, :under, :visitor, :visitor_moneyline, :visitor_spread

      def initialize(data)
        @_data = data
        @updated_at = Time.now
        parse
      end

      private

      def parse
        desc = Nokogiri::HTML(_data[:description])
        @elements = desc.xpath('//body').first.children

        parse_time
        parse_teams
        parse_lines
        parse_total
      end

      def parse_lines
        teams = { home: [6, 8], visitor: [2, 4] }
        teams.each do |team, num|
          instance_variable_set("@#{team}_spread", parse_spread(@elements[num[0]]))
          instance_variable_set("@#{team}_moneyline", Line.new(:moneyline, @elements[num[1]].text.to_i))
        end
      end

      def parse_spread(element)
        spread = element.text.split(' ')
        Line.new(:spread, spread.last[1...-1].to_i, spread.first.to_d)
      end

      def parse_teams
        teams = _data[:title].split(' @ ')
        @visitor = teams.first
        @home = teams.last
      end

      def parse_time
        format = '%m-%d-%y %H:%M %p %z'
        tz = 'Eastern Time (US & Canada)'
        @time = DateTime.strptime("#{_data[:pubDate]} #{tz}", format)
      end

      def parse_total
        over = @elements[10].text.split(' ')
        under = @elements[12].text.split(' ')
        @total = over[1].to_d
        @over = Line.new(:total, over[2][1...-1].to_i, @total)
        @under = Line.new(:total, under[2][1...-1].to_i, @total)
      end
    end
  end
end
