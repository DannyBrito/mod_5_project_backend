Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do 

      resources :users
      resources :listings 
      resources :favorites

      get '/users/:id/favorites', to: 'users#favorite_index'
      get '/users/:id/ownlistings', to: 'users#own_listings'
      get '/users/:id/in_cart', to: 'users#in_cart'
      get '/users/:id/adquired', to: 'users#adquired'
      post '/buy_adquire/:id', to: 'favorites#buy_adquire'
      post '/users/:id/listings', to: 'users#create_listing'
      post '/login', to: 'auth#create'
  
    end
  end
end
