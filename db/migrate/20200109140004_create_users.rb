class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :image_url, default: 'https://res.cloudinary.com/djxdupfed/image/upload/profile/5.jpg'
      t.text :bio
      t.string :area
      t.string :password_digest
      t.timestamps
    end
  end
end
