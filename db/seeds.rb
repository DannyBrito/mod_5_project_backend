# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

URL = 'https://res.cloudinary.com/djxdupfed/image/upload/'

User.destroy_all
Listing.destroy_all
Favorite.destroy_all
Cart.destroy_all

u1 = User.create(username:'dan',password:'123', bio: Faker::Quote.most_interesting_man_in_the_world,image_url:"#{URL}profile/#{rand(1..7)}.jpg")
u2 = User.create(username:'rick',password:'123',bio: Faker::Quote.most_interesting_man_in_the_world,image_url:"#{URL}profile/#{rand(1..7)}.jpg")
u3 = User.create(username:'tim',password:'123',image_url:"#{URL}profile/#{rand(1..7)}.jpg",bio: Faker::Quote.most_interesting_man_in_the_world)

users = [u1,u2,u3]
conditions = ['new','brand-new','fair','ok','poor']
# 20.times do 
# curUser = users.sample()
# curUser.ownlistings.create(title:Faker::Coffee.blend_name,condition:conditions.sample(),price:rand(20..2000),units:rand(1..20),description:Faker::Marketing.buzzwords)
# end

u1.ownlistings.create(title:'car',condition:'old', price:2000,units:1,image_url:"#{URL}bluecar.jpg")
u2.ownlistings.create(title:'iPhone X',condition:'brand new', price:1500,units:6,image_url:"#{URL}iphonex.jpg")

# file:///Users/danny/Desktop/seed_images/
l1 = Listing.create(creator:u2,title:'pillow',condition:'ok',price:120,on_stock:false,image_url:"#{URL}pillow.jpg")
l2 = Listing.create(creator:u2,title:'grapes',condition:'fresh',price:2,image_url:"#{URL}grapes.jpg")
l3 = Listing.create(creator:u2,title:'private jet',condition:'',price:2000000.1,image_url:"#{URL}jet.jpg")

l4 = Listing.create(creator:u2,title:'rubber bands',condition:'fragil',price:1.99,image_url:"#{URL}rubberband.jpg")

l5 = Listing.create(creator:u2,title:'long board',condition:'new',price:2000,on_stock:false,image_url:"#{URL}longboard.jpg")


l6 = Listing.create(creator:u2,title:'Asus ZenBook',condition:'new',price:1000,on_stock:true,description:"Asus ZenBook 13 Ultra-Slim Laptop 13.3” FHD Wideview, 8th-Gen Intel Core i7-8565U Processor, 16GB LPDDR3, 512GB PCIe SSD, Backlit KB, Numberpad, Military-Grade",image_url:"#{URL}pc.jpg")

#art testing


l7 = Listing.create(creator:users.sample(),title:'Nintendo Switch',condition:'brand-new',price:0,on_stock:true,description:"Play your way with the Nintendo Switch gaming system. Whether you’re at home or on the go, solo or with friends, the Nintendo Switch system is designed to fit your life. Dock your Nintendo Switch to enjoy HD gaming on your TV. Heading out? Just undock your console and keep playing in handheld mode",image_url:"#{URL}switch.jpg")

l8 = Listing.create(creator:users.sample(),title:'Beats Solo3 Wireless',condition:'broken',price:400,on_stock:true,description:"The new Club Collection Solo 3 Wireless colors do not come with the optional RemoteTalk Control cable but the cable is still available for purchase if you want to have a wired connection to your devices. You can connect the Solo 3 Wireless headphones to your devices wirelessly right out of the box.",image_url:"#{URL}beats.jpg")

l9 = Listing.create(creator:users.sample(),title:'Ray-Ban Sunglasses',condition:'ok',price:100,on_stock:true,description:"UNISEX SUNGLASSES: The Original Ray-Ban Wayfarer features legendary G-15 lenses, in both polarized and non-polarized options, perfect for both women and men. Made from high-quality glass, Ray-Ban lenses are prescription ready.",image_url:"#{URL}sunglass.jpg")

l10 = Listing.create(creator:users.sample(),title:'Adidas SwiftRun Shoes',condition:'ok',price:10,on_stock:true,description:"Just Shoes",image_url:"#{URL}addidasshoes.jpg")

l11 = Listing.create(creator:users.sample(),title:'Watch - Time Machine',condition:'new',price:1000000,on_stock:true,description:"01110010 01100101 01100001 01101100 00100000 01110100 01101001 01101101 01100101 00100000 01101101 01100001 01100011 01101000 01101001 01101110 01100101 ",image_url:"#{URL}watchf.jpg")

l11 = Listing.create(creator:users.sample(),title:'Pixel Truck',condition:'broken windows',price:100,on_stock:true,description:"Try me",image_url:"#{URL}pixeltruck.jpg")

l12 = Listing.create(creator:users.sample(),title:'Pizza Socks',condition:'fresh and extra cheesy',price:3500,on_stock:true,description:"Try me",image_url:"#{URL}pizzasocks.jpg")

l13 = Listing.create(creator:users.sample(),title:'Iphone',condition:'old',price:10000,on_stock:true,description:"Good Luck Paying it",image_url:"#{URL}iphone.jpg")

l14 = Listing.create(creator:users.sample(),title:'Echo Dot',condition:'brand-new',price:30,on_stock:true,description:"Meet Echo Dot - Our most popular smart speaker with a fabric design. It is our most compact smart speaker that fits perfectly into small spaces.",image_url:"#{URL}echodot.jpg")

l15 = Listing.create(creator:users.sample(),title:'Death Wish Coffee',condition:'ok',price:30,on_stock:true,description:"Get your Death Wish Coffee fix with this smooth dark roast coffee that is conveniently ground for your auto-drip coffee maker",image_url:"#{URL}deadwishcoffee.jpg")

l16 = Listing.create(creator:users.sample(),title:'Yatch',condition:'new',price:30000,on_stock:true,description:"Make it rain",image_url:"#{URL}yatch.jpg")

l17 = Listing.create(creator:users.sample(),title:'Samsung Tv Qled',condition:'fair',price:30000,on_stock:true,description:"---",image_url:"#{URL}flattv.jpg")

l18 = Listing.create(creator:users.sample(),title:'4k Fire Stick',condition:'fair',price:24,on_stock:true,description:"The most powerful 4K streaming media stick",image_url:"#{URL}firestick.jpg")

l19 = Listing.create(creator:users.sample(),title:'Smartwater',condition:'smart',price:10,on_stock:true,description:"The most powerful water - 6 pack",image_url:"#{URL}watersmart.jpg")

l20 = Listing.create(creator:users.sample(),title:'Clorox Wipes',condition:'new',price:15,on_stock:true,description:"clean clean clean!",image_url:"#{URL}cloroxwipes.jpg")

l21 = Listing.create(creator:users.sample(),title:'Gold Bars',condition:'malleable',price:150000,on_stock:true,description:"fine gold",image_url:"#{URL}goldbars.jpg")

l22 = Listing.create(creator:users.sample(),title:'Moon Rock',condition:'space',price:15000000,on_stock:true,description:"MOON!!",image_url:"#{URL}moonrock.jpg")

u1.carts.create(listing:l1,price:l1.price)
u1.carts.create(listing:l2,price:l2.price)
u1.carts.create(listing:l3,price:l3.price)
u1.carts.create(listing:l4,price:l4.price)
u1.carts.create(listing:l5,price:l5.price)
