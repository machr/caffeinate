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
  @shops = Shop.all
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
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    @shops = Shop.all
    erb :index
  end
end

#log out
delete '/session' do
  session[:user_id] = nil
  redirect '/'
end

#########################################

get '/dashboard' do
  redirect '/' unless logged_in?
  @services = Service.all
  @current_user = current_user

  erb :dashboard

end

# Add Cafe from dashboard
post '/dashboard/add' do
  shop = Shop.new
  shop.name = params[:name]
  shop.address = params[:address]
  shop.city = params[:city]
  shop.state = params[:state]
  shop.postcode = params[:postcode]
  shop.logo_url = params[:logo_url]
  shop.link_url = params[:link_url]
  services = params[:services]

  # give ownership
  shop.shop_owner_id = current_user.id

  # add amenities to shop
  services.each do |service_name, service_id|
    shop.shop_services.build(service_id: service_id)
  end
  shop.save

  if shop.save #WOHOO
    redirect to '/shops'
  else #Aww
    erb :dashboard
  end
end

get '/update' do
  erb :shop
end

# Edit / update
put '/shops/:id' do
  # binding.pry
  redirect '/' unless logged_in?
  shop = Shop.find(params[:id])
  shop.name = params[:name]
  shop.address = params[:address]
  shop.city = params[:city]
  shop.state = params[:state]
  shop.postcode = params[:postcode]
  shop.logo_url = params[:logo_url]
  shop.save!
  redirect "/shops/#{ params[:id] }"
end

get '/shops/:id' do
  @shop = Shop.find(params[:id])
  @services = @shop.services
  erb :shop
end

# Delete Cafe from dashboard
post '/shops/:id/delete' do
  redirect '/' unless Shop.shop_owner_id = current_user
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
