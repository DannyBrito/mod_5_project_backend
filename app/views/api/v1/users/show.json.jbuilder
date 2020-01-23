#User Info
json.user(@user,:id, :username, :area, :bio,:image_url)

#User created Listings
json.own_listing_number @user.ownlistings.count

    if(@user.ownlistings.count >=1)
        json.ownlistings @user.ownlistings do |listing|
            json.(listing,:id,:title)
        end
    end

#User favorited Listings
json.fav_listings_number @user.favlistings.count
    if(@user.favlistings.count >=1)
        json.favlistings @user.favlistings do |listing|
            json.(listing,:id,:title)
            json.seller(listing.creator,:id,:username)
        end
    end
