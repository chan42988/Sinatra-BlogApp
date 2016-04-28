require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/reloader'
require 'bundler/setup'
require 'rack-flash'

# enable :sessions
# use Rack::Flash, sweep => true

set :database, 'sqlite3:blogapp.sqlite3'
set :session, true

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

get '/' do
	
	erb :home

end




get '/signup' do

	erb :signup

end



#  '/sign-up' do



# end

# #=================================================



#=================================================


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

# end

post '/sign-in' do
	@user = User.where(username: params[:username]).first
	if @user.password == params[:password]
		redirect '/'
	else
		redirect '/login-failed'
	end
end


get '/users/:id' do
	@user = User.find(params[:id])
	erb :profile
end
# >>>>>>> 9aa9412a5a10067bb6024d299a515543e4feecf6
