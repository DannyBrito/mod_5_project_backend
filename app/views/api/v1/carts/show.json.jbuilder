json.cart_listing do
json.cart_id @cart.id
json.listing_id @cart.listing.id
json.(@cart.listing,:title,:description,:price,:condition,:units,:image_url,:category,:on_stock)
end
json.cart_total @total if @total