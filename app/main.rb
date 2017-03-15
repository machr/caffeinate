require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'database_config'
require_relative 'models/shop'
require_relative 'models/shop_group'
require_relative 'models/shop_owner'
require_relative 'models/shop_service'
require_relative 'models/group'
require_relative 'models/service'

enable :sessions

helpers do

  def current_user
    ShopOwner.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user  #current_user != nil
  end

end

after do
  ActiveRecord::Base.connection.close
end


get '/' do
  erb :index
end



get '/shops' do
  @shops = Shop.all
  erb :shops
end


# User signup
get '/registration/create' do
  erb :signup
end

post '/registration' do
  shop_owner = ShopOwner.new
  shop_owner.firstname = params[:firstname]
  shop_owner.lastname = params[:lastname]
  shop_owner.email = params[:email]
  shop_owner.phone = params[:phone]
  shop_owner.password = params[:password]

  shop_owner.save

  if shop_owner.save
    redirect to '/dashboard'
  else
    erb :signup
  end
end

# create session for login. You can only have one session at a time
get '/session/new' do
  erb :index
end

# Login to site
post '/session' do
  user = ShopOwner.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    #check if there is a user with that email and checks password for that user
    # you are okay, let me create a session for you
    # Global variable that is a hash. creates a cookie. [:user_id] is made up
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    # Who are you even?!
    erb :index # Until it correct, keep trying to login
  end
end

#log out
delete '/session' do
  session[:user_id] = nil
  redirect '/'
end

#########################################

get '/dashboard' do
  erb :dashboard
end

# Add Cafe from dashboard
post '/dashboard/add' do
  shop = Shop.new
  shop.name = params[:name]
  shop.address = params[:address1]
  shop.city = params[:city]
  shop.state = params[:state]
  shop.postcode = params[:postcode]
  shop.logo_url = params[:logo_url]

  shop.save

  if shop.save #WOHOO
    redirect to '/shops'
  else #oooww
    erb :dashboard
  end
end

get '/update' do
  erb :shop
end

get '/shops/:id' do
  @shop = Shop.find(params[:id])
  erb :shop
end

# Delete Cafe from dashboard
post '/shops/:id/delete' do
  dish = Shop.find(params[:id])
  dish.destroy
  redirect '/shops'
end

# Edit Cafe from dashboard
get '/shops/:id/edit' do
  # return params.to_json
  @shop = Shop.find(params[:id])
  erb :shop
end

# binding.pry
