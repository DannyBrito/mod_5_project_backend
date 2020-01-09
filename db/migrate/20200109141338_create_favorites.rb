class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :units, default: 1
      t.boolean :in_cart, default: false
      t.boolean :in_fav, default: true
      t.boolean :adquired, default: false
      t.integer :listing_id

      t.timestamps
    end
  end
end
