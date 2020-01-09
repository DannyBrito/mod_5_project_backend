class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :category
      t.string :condition, default: 'new'
      t.float :price
      t.integer :units, default: 1
      t.boolean :on_stock, default: true
      t.string :image_url, default: 'http://viegenpharma.com/wp-content/uploads/2019/01/NoImageFound.jpg.png'

      t.timestamps
    end
  end
end
