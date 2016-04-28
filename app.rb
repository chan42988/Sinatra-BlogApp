require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/reloader'
require 'bundler/setup'
require 'rack-flash'

# enable :sessions
# use Rack::Flash, sweep => true
configure(:development){set :database, "sqlite3:blog.sqlite3"}

set :database, 'sqlite3:blogapp.sqlite3'
set :session, true


def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

get '/' do
	
	@users = User.all
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

post "/sign-in" do
	@user = User.where(username: params[:username]).first
	if @user && @user.password == params[:password]
		session[:user_id] = @user.id
	end
		redirect '/'
end


get '/users/:id' do
	@user = User.find(params[:id])
	erb :profile
end
