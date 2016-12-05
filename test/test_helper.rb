# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

Rails::TestUnitReporter.executable = 'bin/test'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

def file_path(name)
  Rails.root.join('test', 'files', "#{name}.xml").to_s
end

%w(nfl).each do |type|
  define_method("#{type}") do |local_file = true|
    return if instance_variable_defined?("@#{type}")

    klass = "sportsbook_ag/feed/#{type}".classify.constantize
    path = local_file ? file_path(klass::FEED_NAME) : nil
    instance_variable_set("@#{type}", klass.new(path))
  end
end
