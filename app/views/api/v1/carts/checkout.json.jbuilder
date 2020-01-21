json.avalible_listings  @updatedListings do |listing|
    json.(listing,:id,:title,:on_stock,:condition,:description,:price,:category) 
    if(listing.listing_image.attached?) 
    json.url listing.key_blob
    else
    json.url listing.image_url
    end
end
json.unavalible_listings_ids @unavalible_listings
json.success_listings_buy @listings_to_update_ids
json.adquired_items @adquired_items
json.total @total

json.own_listings  @own_listings do |listing|
    json.(listing,:id,:title,:on_stock,:condition,:description,:price,:category) 
    if(listing.listing_image.attached?) 
    json.url listing.key_blob
    else
    json.url listing.image_url
    end
end
json.fav_listings  @fav_listings do |listing|
    json.(listing,:id,:title,:on_stock,:condition,:description,:price,:category) 
    if(listing.listing_image.attached?) 
    json.url listing.key_blob
    else
    json.url listing.image_url
    end
end

