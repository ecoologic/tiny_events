# TODO: config app
set :show_exceptions, false
set :raise_errors, false

require 'json'
require 'english'

require_relative 'db/setup.rb'
require_relative 'domain/models.rb'
require_relative 'web/routes.rb'
