require 'sqlite3'
require "sinatra/activerecord"

DB = SQLite3::Database.new 'db/db.sqlite3'

set :database, { adapter: "sqlite3", database: "db/db.sqlite3" }
