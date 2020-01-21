json.array! @listings do |listing|
    json.(listing,:id,:title,:on_stock,:condition,:description,:price,:category)
    json.avalible_units listing.units
    if(listing.listing_image.attached?) 
        json.url listing.key_blob
        if(!listing.on_stock)
            json.sold_url listing.sold_link
        end
    else
        json.url listing.image_url
    end 
    if(!@no_seller) #when seller is checking its listings
    json.seller(listing.creator,:id,:username)
    end
end
  