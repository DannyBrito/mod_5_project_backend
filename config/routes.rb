Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do 

      resources :users
      resources :listings 
      resources :favorites
      resources :carts

      get '/users/:id/favorites', to: 'users#favorite_index'
      get '/users/:id/ownlistings', to: 'users#own_listings'
      get '/users/:id/in_cart', to: 'users#in_cart'
      post '/users/:id/adquired', to: 'users#adquire_cart_items'
      get '/users/:id/adquired', to: 'users#adquired'
      post '/users/:id/listings', to: 'users#create_listing'
      post '/login', to: 'auth#create'
      get '/search/:q', to: 'listings#search'
      get '/listings_out_stock', to:'listings#index_out_stock'
      post '/testing', to: 'users#testing'
    end
  end
end
