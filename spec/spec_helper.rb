require 'pry'
require 'rack/test'
require 'rspec'

require_relative '../app'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() App end
end

RSpec.configure { |c| c.include RSpecMixin }
