class Api::V1::FavoritesController < ApplicationController
    before_action :find_favorite, except: []

    def show
    end

    def update
        @favorite.update(favorite_params)
    end

    private 

    def favorite_params
        params.require(:favorite).permit(:in_cart,:adquired,:units) #will need to add in_fav
    end

    def find_favorite
        @favorite = Favorite.find(params[:id])
    end
end
