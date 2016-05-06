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
	@posts = Post.all
	erb :home
end


get '/signup' do

	erb :signup

end


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
	@post = current_post.update(username: params[:username], password: params[:password], fname: params[:fname], lname: params[:lname], birthday: params[:birthday], email: params[:email])
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


post '/post' do
	if params[:body] != " "
		Post.create(title: params[:title], body: params[:body], user_id: current_user.id)
	end
	redirect '/'
end


get '/users/:id' do
	@user = User.find(params[:id])
	@posts = Post.where(user_id: params[:id])
	erb :profile
end


get '/edit/:id' do
	@user = current_user
	erb :edit
end


get '/members' do
	@users = User.all
	erb :members
end

post "/PEdit/:id" do
	@post = Post.find(params[:id])
	@post.update(title:params[:title], body: params[:body])
	redirect '/'
end

post "/PDelete/:id" do
	@post = Post.find(params[:id])
	@post.destroy
	redirect '/'
end

get "/PEdit/:id" do
		@post = Post.find(params[:id])
		erb :PEdit
end



# get 'follow/:id' do
# 	follow.create 
# end


# post '/posts/new' do
	
# end



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


