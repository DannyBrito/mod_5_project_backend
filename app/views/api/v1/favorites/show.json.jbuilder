# json.(@favorite,:id,:in_cart,:adquired)
# json.track_units @favorite.units
# json.subtotal @favorite.units.to_f * @favorite.listing.price.to_f #to float?
# json.user_tracking(@favorite.user,:id,:username)
# json.item(@favorite.listing,:id,:title,:units,:price)


json.fav_id @favorite.id
json.track_units @favorite.units
json.(@favorite.listing,:id,:title,:description,:price,:condition,:units,:category,:on_stock)

if(@favorite.listing.listing_image.attached?) 
    json.url @favorite.listing.key_blob
else
    json.url @favorite.listing.image_url
end