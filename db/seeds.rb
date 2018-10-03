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




#user
user_1 = User.create(name: "ali", email: "ali@exemple.com", password: "ali", password_confirmation: "ali")
user_2 = User.create(name: "cam", email: "cam@exemple.com", password: "cam", password_confirmation: "cam")
user_3 = User.create(name: "kay", email: "kay@exemple.com", password: "kay", password_confirmation: "kay")
user_4 = User.create(name: "ed", email: "ed@exemple.com", password: "ed", password_confirmation: "ed")
user_5 = User.create(name: "jo", email: "jo@exemple.com", password: "jo", password_confirmation: "jo")
user_6 = User.create(name: "dan", email: "dan@exemple.com", password: "dan", password_confirmation: "dan")
