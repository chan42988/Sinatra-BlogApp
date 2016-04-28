require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/reloader'
require 'bundler/setup'
require 'rack-flash'

# enable :sessions
# use Rack::Flash, sweep => true
configure(:development){set :database, "sqlite3:blogapp.sqlite3"}
set :sessions, true


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

post "/sign-up" do
	if params[:username] != " " && params[:password] != " " && params[:fname] != " " && params[:lname] != " " && params[:birthday] != " " && params[:email] != " "
		User.create(username: params[:username], password: params[:password], fname: params[:fname], lname: params[:lname], birthday: params[:birthday], email: params[:email])
	end
		redirect '/'
end



post "/edit" do
	@user.update(username: params[:username], password: params[:password], fname: params[:fname], lname: params[:lname], birthday: params[:birthday], email: params[:email])
	redirect '/'
end

get "/delete" do
	@user = current_user
	@user.destroy
	session.clear
	redirect '/'
end




get "/log-out" do
		session[:user_id] = nil
		redirect '/'
end


get '/users/:id' do
	@user = User.find(params[:id])
	erb :profile
end

get '/edit/:id' do
	@user = User.find(params[:id])
	erb :edit
end

get '/members' do
	erb :members
end
