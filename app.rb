require 'sinatra'
require 'json'

require_relative 'config/db.rb'
# TODO: Dir["domain/**/*.rb"].sort.each { |f| require f }

## Routes ##

class Event < ActiveRecord::Base
end

post '/events' do
  content_type :json
  Event.create(params[:event])

  { success: true }.to_json
end

# TODO: remove
get '/test' do
  content_type :json
  { is: 'a JSON' }.to_json
end
