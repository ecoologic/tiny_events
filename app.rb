require 'sinatra'
require 'json'

require_relative 'config/db.rb'

# TODO: remove
get '/test' do
  content_type :json
  { is: 'a JSON' }.to_json
end
