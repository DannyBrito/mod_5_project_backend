class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :listing_id
      t.integer :user_id
      t.boolean :adquired, default: false
      t.boolean :in_cart, default: true
      t.float :price
      t.timestamps
    end
  end
end
