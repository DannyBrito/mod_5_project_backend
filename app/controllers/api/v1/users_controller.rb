class Api::V1::UsersController < ApplicationController
    before_action :find_user, except: [:index,:create]

    #------------------------------- ******** REST ******** -------------------------------#
    
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
    
#------------------------------- ******** Cart ******** -------------------------------#
    


    def adquire_cart_items
        @in_cart = @user.carts.where(in_cart:true) #adquire used to check if listing was already adquired by current user
        @listings_from_cart = @user.cartlistings.where("carts.in_cart = true")
        
        #listings to update once bought

        @listings_to_update = @listings_from_cart.where(on_stock:true)
        @listings_to_update_ids = @listings_from_cart.where(on_stock:true).ids
        @unavalible_listings_ids = @listings_from_cart.where(on_stock:false).ids
        # @include_amounts = true
        @in_cart.each do |cart|
            if(cart.listing.on_stock)
                cart.update(in_cart:false,adquired:true)
                # cart.listing(on_stock:false)
            else
                cart.destroy
            end
        end

        # need to go this way as using ones saved previously into variable it only references and reruns query
        Listing.where(id:@listings_to_update_ids).update_all(on_stock:false)
        @updatedListings = Listing.on_stock
        @unavalible_listings = Listing.where(id:@unavalible_listings_ids)
        @listings_to_update_ids = Listing.where(id:@listings_to_update_ids)
        @adquired_items = @user.cartlistings.where("carts.adquired = true")
        @own_listings = @user.ownlistings
        @total = @listings_to_update_ids.sum(:price)
        render 'api/v1/carts/checkout'
        
    end
    
    # users/:id/in_cart
    def in_cart
        @in_cart = @user.carts.where(in_cart:true)
        render 'api/v1/carts/index'
    end

    # users/:id/adquired
    def adquired #already bought
        @in_cart = @user.carts.where(adquired:true)
        render 'api/v1/carts/index'
    end

#------------------------------- ******** Listings ******** -------------------------------#

    #users/:id/listings
    def own_listings
        @listings = @user.ownlistings
        @no_seller = true
        render 'api/v1/listings/index'
    end

     # POST -> users/:id/listings
    def create_listing
        @listing = @user.ownlistings.create(listing_params)
        if(@listing.valid?)
            render 'api/v1/listings/show'
        else
            render json:{message:'error creating listing'}
        end
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

    #Listing Params 
    def listing_params
        params.require(:listing).permit(:title,:condition,:description,:price,:units)
    end
end
 