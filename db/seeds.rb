# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Listing.destroy_all
Favorite.destroy_all

u1 = User.create(username:'dan',password:'123')
u2 = User.create(username:'rick',password:'123')
u3 = User.create(username:'tim',password:'123')

users = [u1,u2,u3]
conditions = ['new','brand-new','fair','ok','poor']
100.times do 
curUser = users.sample()
curUser.ownlistings.create(title:Faker::Coffee.blend_name,condition:conditions.sample(),price:rand(20..2000),units:rand(1..20))
end

u1.ownlistings.create(title:'car',condition:'new', price:2000,units:1)
u2.ownlistings.create(title:'iphone',condition:'brand new', price:1500,units:6)


l1 = Listing.create(creator:u2,title:'phone',condition:'new',price:1200,on_stock:false)
l2 = Listing.create(creator:u2,title:'phonex',condition:'old',price:2000)
l3 = Listing.create(creator:u2,title:'ophone1',condition:'ok',price:20)
l4 = Listing.create(creator:u2,title:'xhone2',condition:'poor',price:20000)
l5 = Listing.create(creator:u2,title:'phcone3',condition:'new',price:110,on_stock:false)
#art testing

u1.carts.create(listing:l1,price:l1.price)
u1.carts.create(listing:l2,price:l2.price)
u1.carts.create(listing:l3,price:l3.price)
u1.carts.create(listing:l4,price:l4.price)
u1.carts.create(listing:l5,price:l5.price)
