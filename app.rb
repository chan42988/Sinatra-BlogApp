require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/reloader'
require 'bundler/setup'
require 'rack-flash'

set :database, 'sqlite3:blogapp.sqlite3'

get '/' do
	
	erb :home

end