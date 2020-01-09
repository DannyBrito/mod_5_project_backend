json.array! @listings do |listing|
    json.(listing,:id,:title,:on_stock,:condition,:description,:price,:category,:image_url)
    json.avalible_units listing.units

    if(!@no_seller) #when seller is checking its listings
    json.seller(listing.creator,:id,:username)
    end
end
  