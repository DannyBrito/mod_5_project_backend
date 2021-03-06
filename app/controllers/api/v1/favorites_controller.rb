class Api::V1::FavoritesController < ApplicationController
    before_action :find_favorite, except: [:buy_adquire,:create]

    def show
    end
    
    def create
        @favorite = Favorite.create(favorite_params)
        if(@favorite.valid?)
            render 'api/v1/favorites/show'
        else
            render json: {message: 'error creating favorite'}, status: :not_acceptable
        end
    end

    def update
        @favorite.update(favorite_params)
    end

    def destroy
        @favorite.destroy
        render json: {fav_id:@favorite.id, message: 'favorite successful deleted'},status: :ok
    end
    #gets an aray of ids to set them to adquire and update listing?
    def buy_adquire
        @favorites = []
        @failed_to_adquired = {total:0,items:{}}
        # if(params[:id] == current_user.id)
            params[:fav_ids].each{|id|
                fav = Favorite.find(id)
                listing = fav.listing
                units_to_buy = fav.units
                units_avalible = listing.units
                result = units_avalible - units_to_buy
                if(units_to_buy <= units_avalible)
                    listing.update(units:result)
                    fav.update(adquired:true,in_cart:false)
                    @favorites << fav
                else
                    @failed_to_adquired[:total] += 1
                    @failed_to_adquired[:items][fav.id] = result
                end
            }
            render 'api/v1/favorites/index'
        # else
        #     render json:{message: 'not authorized'}
        # end
    end

    private 

    def favorite_params
        params.require(:favorite).permit(:user_id,:listing_id,:in_cart,:adquired,:units) #will need to add in_fav
    end

    def find_favorite
        @favorite = Favorite.find(params[:id])
    end
end
