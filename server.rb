require 'sinatra'
require "sinatra/reloader"

# Run this script with `bundle exec ruby app.rb`
require 'sqlite3'
require 'active_record'

#require model classes
require './models/user.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db'
)

register Sinatra::Reloader
enable :sessions

get '/' do
  erb :home, :layout => :layout_main
end
get '/login' do

  erb :login, :layout => :layout_main
end

get '/signup' do

  erb :signup, :layout => :layout_main
end

post '/users/signup' do
  puts "-----------"
  puts params
  puts "----------"
  #-------------Create Users-------
  user_instance = User.create(
    name: params["full_name"],
    birthday: params["birthday"],
    email: params["email"],
    password: params["password"]
  )
  redirect '/'
end