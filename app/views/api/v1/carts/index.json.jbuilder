json.total @in_cart.sum(:price)
json.items @in_cart do |cart|
    json.cart_id cart.id
    json.listing_id cart.listing.id
    json.(cart.listing,:title,:description,:price,:condition,:units,:image_url,:category,:on_stock)
end
    # if(@include_amounts)
    #     json.subtotal (sub =cart.listing.price * cart.units)
    #     total += sub
    # else 
    #     # json.(cart,:in_cart,:adquired)
    # end
    # json.(@listing,:id,:title,:on_stock,:condition,:description,:price,:category,:image_url)

# json.total total if @include_amounts

#need to refactor
# if(@failed_to_adquired[:total] != 0)
#     json.failed_items @failed_to_adquired[:items]
# end