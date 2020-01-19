class Listing < ApplicationRecord
    belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
    has_many :favorites
    has_many :followers, :through => :favorites, :source => :user
    has_many :carts
    has_many :buyers, :through => :carts, :source => :user

    # scope :on_stock_avalibles, -> {where(on_stock:true)}
    def self.out_stock
        Listing.where(on_stock: false)
    end

    def self.on_stock
        Listing.where(on_stock: true)
    end 

end
