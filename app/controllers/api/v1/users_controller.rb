class Api::V1::UsersController < ApplicationController
    before_action :find_user, except: [:index,:create]

    #------------------------------- ******** RESTFUL ******** -------------------------------#
    
    def show 
        # @user
    end

    def index
        @users = User.all
    end

    def create
        @user = User.create(user_params)
        if(@user.valid?) 
            render 'api/v1/users/show'
        else
            render json: {message: 'could not create User'}
        end
    end

    def destroy # need to implement
        # @user
        @user.destroy
    end

    def update
        @user.update(user_params_update)
    end

    #------------------------------- ******** Favorite ******** -------------------------------#
    
    # users/:id/favorites
    def favorite_index
        @favorites = @user.favorites #once db_created need to .where(in_fav:true)
        render 'api/v1/favorites/index'
    end

    # users/:id/in_cart
    def in_cart
        @favorites = @user.favorites.where(in_cart:true,adquired:false) #adquire used to check if listing was already adquired by current user
        @include_amounts = true
        render 'api/v1/favorites/index'
    end

    def adquired
        @favorites = @user.favorites.where(adquired:true)
        @include_amounts = true
        render 'api/v1/favorites/index'
    end

    #users/:id/listings
    def own_listings
        @listings = @user.ownlistings
        @no_seller = true
        render 'api/v1/listings/index'
    end

    private

    #strong user params
    def user_params
        params.require(:user).permit(:username,:password)
    end

     #strong user params
    def user_params_update
        params.require(:user).permit(:bio,:area)
    end

    #set @user for same actions
    def find_user
        @user = User.find(params[:id])
    end
end
 