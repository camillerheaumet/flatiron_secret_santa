# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#




#group1

ali = User.create(name: "Ali", email: "Makdaa1@gmail.com", password: "hello", password_confirmation: "hello")

group_one = Group.create(name: "lazy boys", budget: 100)

wishlist_one = Wishlist.create(user_id: ali.id)

iphone = Gift.create(name: "iPhone", price: 10, description: "Over priced", wishlist_id: wishlist_one.id)






#group2


#group3


#group4
