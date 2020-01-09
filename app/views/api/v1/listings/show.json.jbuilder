json.(@listing,:id,:title,:on_stock,:condition,:description,:price,:category,:image_url)
json.avalible_units @listing.units
json.seller(@listing.creator,:id,:username)