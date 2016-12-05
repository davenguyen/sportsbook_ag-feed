Get sports odds from Sportsbook.ag.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sportsbook_ag-feed'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install sportsbook_ag-feed
```

## Usage

```ruby
# Pull the latest feed
feed = SportsbookAg::Feed::NFL.new
feed.games         #=> [#<SportsbookAg::Feed::Game>, ...]

# Get the raw data:
schedule._data     #=> {:rss=>{:version=>"2.0", ...}}
schedule._xml      #=> "<?xml version=\"1.0\" ..."

# Game and lines details
game = feed.games.first
game.home                 #=> Denver Broncos
game.home_moneyline.odds  #=> -110
game.home_spread.spread   #=> -3.5
game.total                #=> 39
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
