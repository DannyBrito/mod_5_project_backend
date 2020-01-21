json.cart_listing do
json.cart_id @cart.id
json.listing_id @cart.listing.id
json.(@cart.listing,:title,:description,:price,:condition,:units,:category,:on_stock)

if(@cart.listing.listing_image.attached?) 
    json.url @cart.listing.key_blob
else
    json.url @cart.listing.image_url
end
end
json.cart_total @total if @total