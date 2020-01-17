class Api::V1::ListingsController < ApplicationController
    before_action :find_listing, except: [:index,:create,:search]

    def index
        if(params[:limit])
            @listings = Listing.limit(params[:limit])
        else
            @listings = Listing.all
        end
    end

    def show
        if(!@listing) 
            render json:{message:'listing not found'}
        end
    end

    def create #concept implemented where you will be able to get user through authentification
        @listing = Listing.new(listing_params)
        @listing.creator = User.find_by(username:'rick') # fixed to one specific user
        # @listing.creator = current_user #return current_loging user instance
        if(@listing.save)
            render 'api/v1/listings/show'
        else
            render json: {message: 'error could not create listing for user'}
        end
    end

    def update
        if(@listing.creator == current_user) #check if user authorize to edit own_post and someone else
            @listing.update(listing_params)
            render 'api/v1/listings/show'
        else
            render json: {message: 'no right authorization to complete action'}
        end
    end

    #GET => /search/:q
    def search
        @listings = Listing.where("title ILIKE ?", "%#{params[:q]}%")
        render 'api/v1/listings/index'
    end

    private

    def listing_params
        params.require(:listing).permit(:title,:description,:category,:condition,:price,:units,:on_stock,:image_url)
    end

    def find_listing
        begin
            @listing = Listing.find(params[:id])
        rescue => exception
            @listing = nil
        end
    end
    
end
