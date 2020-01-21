class Listing < ApplicationRecord

    include Rails.application.routes.url_helpers

    belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
    has_many :favorites
    has_many :followers, :through => :favorites, :source => :user
    has_many :carts
    has_many :buyers, :through => :carts, :source => :user

    has_one_attached :listing_image
    # scope :on_stock_avalibles, -> {where(on_stock:true)}
    def self.out_stock
        Listing.where(on_stock: false)
    end

    def self.on_stock
        Listing.where(on_stock: true)
    end 

    def url_for_image
        url_for(self.listing_image)
    end

    def key_blob
        "https://res.cloudinary.com/djxdupfed/image/upload/#{self.listing_image.blob.key}.jpg"   
    end
    
    def sold_link
        "https://res.cloudinary.com/djxdupfed/image/upload/t_sold/#{self.listing_image.blob.key}.jpg"   
    end

end
