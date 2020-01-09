total = 0.00
json.items @favorites do |favorite|
    json.id favorite.id
    json.track_units favorite.units
    if(@include_amounts)
        json.subtotal (sub =favorite.listing.price * favorite.units)
        total += sub
    else 
        json.(favorite,:in_cart,:adquired)
    end
    json.listing(favorite.listing,:id,:title,:price,:condition,:units,:image_url)
end

json.total total if @include_amounts