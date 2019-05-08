# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker
User.destroy_all
Item.destroy_all
Vendor.destroy_all
5.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password", address: Faker::Address.full_address, vendor: false)
  
end

Category.create(name:"Electronics")
Category.create(name: "Vehicle")
Category.create(name: "Home")
Category.create(name: "Appliances")
Category.create(name: "Books")

20.times do
Item.create(name: Faker::Device.model_name, price: Faker::Commerce.price(range = 200..1300), category_id: 1, vendor_id: Faker::Number.between(1, 5))
Item.create(name: Faker::Appliance.brand, price: Faker::Commerce.price(range = 800..2000), category_id: 4, vendor_id: Faker::Number.between(1, 5))
Item.create(name: Faker::House.furniture, price: Faker::Commerce.price(range = 500..2000), category_id: 3, vendor_id: Faker::Number.between(1, 5))
Item.create(name: Faker::Book.title, price: Faker::Commerce.price(range = 15..50), category_id: 5, vendor_id: Faker::Number.between(1, 5))
Item.create(name: Faker::Vehicle.make_and_model, price: Faker::Commerce.price(range = 10000..50000), category_id: 2, vendor_id: Faker::Number.between(1, 5))
end

20.times do
  Purchase.create(user_id: Faker::Number.between(1, 5), item_id: Faker::Number.between(1, 40))
end
