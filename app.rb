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



# get 'signup' do

# 	erb :signup

# end



#  '/sign-up' do



# end

# #=================================================

# post '/sign-in' do
# 	@user = User.where(username: params[:username]).first
# 	if @user && @user.password == params[:password]
# 		session[:user_id] = @user.id
# 		flash[:notice] = "You've been signed in successfully."
# 		redirect "/posts/new"
# 	else
# 		flash[:alert] = "There was a problem signing you in."
# 	end
# 		redirect "/"
# end