# total = 0.00
json.array! @favorites do |favorite|
    json.fav_id favorite.id
    json.track_units favorite.units
    # if(@include_amounts)
    #     json.subtotal (sub =favorite.listing.price * favorite.units)
    #     total += sub
    # else 
    #     # json.(favorite,:in_cart,:adquired)
    # end
    json.(favorite.listing,:id,:title,:description,:price,:condition,:units,:image_url,:category,:on_stock)
    # json.(@listing,:id,:title,:on_stock,:condition,:description,:price,:category,:image_url)
end

# json.total total if @include_amounts

#need to refactor
# if(@failed_to_adquired[:total] != 0)
#     json.failed_items @failed_to_adquired[:items]
# end