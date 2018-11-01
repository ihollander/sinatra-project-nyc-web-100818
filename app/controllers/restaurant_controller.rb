class RestaurantController < ApplicationController
  
  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :"restaurants/index"
  end

  get '/restaurants/new' do
    erb :"restaurants/new"
  end

  get '/restaurants/search' do
    # call Yelp API and return response to form
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @users = User.all
    erb :"restaurants/show"
  end

  post '/restaurants/:id/users' do
    user = User.find(params[:restaurants][:user_id])
    restaurant = Restaurant.find(params[:id])
    restaurant.users << user
    redirect "/restaurants/#{restaurant.id}"
  end

end