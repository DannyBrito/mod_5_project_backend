class Api::V1::CartsController < ApplicationController
    before_action :find_cart, except: [:create]


    def destroy
        @cart.destroy
        @total = User.find(@cart.user.id).carts.where(in_cart:true).sum(:price)
        render json:{cart_id: @cart.id,total:@total}, status: :ok
    end

    def create
        @listing = Listing.find(params[:listing_id])
        @user = User.find(params[:user_id])
        @cart = Cart.create(user_id:@user.id,listing_id:@listing.id,price:@listing.price)
        @total = @user.carts.where(in_cart:true).sum(:price)
        if(@cart.valid?)
            render 'api/v1/carts/show'
        else
            render json:{message:"sorry we could not add item to cart"},status: :not_acceptable
        end
    end

    def update
        #no implemented need
    end
    

    private

    def  find_cart
        @cart = Cart.find(params[:id])
    end

    def cart_params
        params.require(:cart).permit(:adquired,:in_cart,:price)
    end

end