require 'status'
require 'test/unit'
require 'rack/test'

set :environment, :test

class StatusTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  def test_it_has_blog
    get '/'
    assert last_response.ok?
    assert_match 'A Fresh Alternative:',last_response.body
  end
end