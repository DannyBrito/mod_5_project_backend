class Api::V1::FavoritesController < ApplicationController
    def update
        
    end

    private 

    def favorite_params
        params.require(:favorite).permit(:in_cart,:adquired,:units) #will need to add in_fav
    end
end
