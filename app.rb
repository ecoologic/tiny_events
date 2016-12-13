require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'english'

require_relative 'db/setup.rb'
require_relative 'domain/models/venue.rb'
require_relative 'domain/models/event.rb'
require_relative 'web/apis.rb'
