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

post '/users/login' do

  user = User.find_by(email: params["email"], password: params["password"])
  if user 
    session[:user_id] = user.id
    redirect '/'
  else 
    redirect '/login'
  end

end

get '/signup' do

  erb :signup, :layout => :layout_main
end

post '/users/signup' do
  puts "-----------"
  puts params
  puts "----------"
  temp_user = User.find_by(email: params['email'])
    if temp_user
      redirect '/login'
  #-------------Create Users-------
    else
  user_instance = User.create(
    name: params["full_name"],
    birthday: params["birthday"],
    email: params["email"],
    password: params["password"]
  )
  redirect '/'
    end
end

get '/logout' do 
  session[:user_id] = nil
  redirect '/'
end

get '/blog' do
  
 if 
  session[:user_id]
 erb :blog, :layout => :layout_main
 else
  erb :login, :layout => :layout_main
 end

end

get '/settings' do

  erb :settings, :layout => :layout_main
end
