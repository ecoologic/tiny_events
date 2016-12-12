require 'sqlite3'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'db/db.sqlite3' }
