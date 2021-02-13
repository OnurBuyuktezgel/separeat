# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Dish.destroy_all
puts "All dishes were deleted"

Restaurant.destroy_all
puts "All restaurants were deleted"

User.destroy_all
puts "All users were deleted"

puts "Creating users..."
@first_user = User.create!(email: "onur@separeat.com", password: "12345678")
@second_user = User.create!(email: "ilona@separeat.com", password: "12345678")
@third_user = User.create!(email: "malin@separeat.com", password: "12345678")
@fourth_user = User.create!(email: "andre@separeat.com", password: "12345678")
@fifth_user = User.create!(email: "toni@separeat.com", password: "12345678")
puts "#{User.count} users were created."

puts "Creating restaurants..."
@first_restaurant = Restaurant.new(name: "Onur's Bar", address: "Cologne City Center", email: "onur@separeat.com", phone: "0049 0121 0121", category: "Bar")
@first_restaurant.user = @first_user
first_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1611082720/iglhfrssj6jcvwzs45og.jpg')
@first_restaurant.photo.attach(io: first_restaurant, filename: 'first_restaurant image', content_type: 'image/jpg')
@first_restaurant.save!

@second_restaurant = Restaurant.new(name: "Ilona's Restaurant", address: "Vienna City Center", email: "ilona@separeat.com", phone: "0043 0123 0123", category: "Polish")
@second_restaurant.user = @second_user
second_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224665/restaurant_ncd9th.jpg')
@second_restaurant.photo.attach(io: second_restaurant, filename: 'second_restaurant image', content_type: 'image/jpg')
@second_restaurant.save!

@third_restaurant = Restaurant.new(name: "Malin's Café", address: "Duesseldorf City Center", email: "malin@separeat.com", phone: "0049 0123 0123", category: "Café")
@third_restaurant.user = @third_user
third_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224663/cafe_ubn02s.jpg')
@third_restaurant.photo.attach(io: third_restaurant, filename: 'third_restaurant image', content_type: 'image/jpg')
@third_restaurant.save!

@fourth_restaurant = Restaurant.new(name: "Andre's Grill", address: "Rio de Janeiro City Center", email: "andre@separeat.com", phone: "0055 2121 2121", category: "Brazilian")
@fourth_restaurant.user = @fourth_user
fourth_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224779/grill_ldo7v1.jpg')
@fourth_restaurant.photo.attach(io: fourth_restaurant, filename: 'fourth_restaurant image', content_type: 'image/jpg')
@fourth_restaurant.save!

@fifth_restaurant = Restaurant.new(name: "Toni's Burgers", address: "Berlin City Center", email: "toni@separeat.com", phone: "0049 0125 0125", category: "Burgers")
@fifth_restaurant.user = @fifth_user
fifth_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224930/burger_xlpnxs.jpg')
@fifth_restaurant.photo.attach(io: fifth_restaurant, filename: 'fifth_restaurant image', content_type: 'image/jpg')
@fifth_restaurant.save!
puts "#{Restaurant.count} restaurants were created."

puts "Creating dishes..."
@first_dish = Dish.new(name: "Single Malt Whisky", todays_special: true, description: "Impresses with its full, fruity aroma.", category: "Alcoholic Beverage", price: 8)
@first_dish.restaurant = @first_restaurant
@first_dish.save!
@second_dish = Dish.new(name: "Blended Malt Whisky", todays_special: false, description: "Impresses with its peppery spiciness.", category: "Alcoholic Beverage", price: 10)
@second_dish.restaurant = @first_restaurant
@second_dish.save!
@third_dish = Dish.new(name: "Scotch Whisky", todays_special: false, description: "Impresses with its sweet vanilla notes.", category: "Alcoholic Beverage", price: 8)
@third_dish.restaurant = @first_restaurant
@third_dish.save!
@fourth_dish = Dish.new(name: "Tennessee Whisky", todays_special: false, description: "Impresses with its dry and spicy aroma.", category: "Alcoholic Beverage", price: 9)
@fourth_dish.restaurant = @first_restaurant
@fourth_dish.save!
@fifth_dish = Dish.new(name: "Bourbon", todays_special: false, description: "Impresses with its characteristic nutty flavours.", category: "Alcoholic Beverage", price: 11)
@fifth_dish.restaurant = @first_restaurant
@fifth_dish.save!

@six_dish = Dish.new(name: "Bigos", todays_special: true, description: "Stew of chopped meat, sauerkraut and fresh shredded cabbage.", category: "Soup", price: 10)
@six_dish.restaurant = @second_restaurant
@six_dish.save!
@seven_dish = Dish.new(name: "Pierogi", todays_special: false, description: "Stuffed dumplings with savoury filling.", category: "Starter", price: 8)
@seven_dish.restaurant = @second_restaurant
@seven_dish.save!
@eight_dish = Dish.new(name: "Cucumber Soup", todays_special: false, description: "Traditional Polish soup made from sour, salted cucumbers and potato.", category: "Soup", price: 8)
@eight_dish.restaurant = @second_restaurant
@eight_dish.save!
@nine_dish = Dish.new(name: "Vodka", todays_special: false, description: "Traditional Polish digestif.", category: "Alcoholic Beverage", price: 5)
@nine_dish.restaurant = @second_restaurant
@nine_dish.save!
@ten_dish = Dish.new(name: "Borscht", todays_special: false, description: "Sour soup made with beetroots, which give the dish its distinctive red color.", category: "Soup", price: 10)
@ten_dish.restaurant = @second_restaurant
@ten_dish.save!

@eleven_dish = Dish.new(name: "Espresso", todays_special: false, description: "Italian Style", category: "Hot Beverages", price: 2)
@eleven_dish.restaurant = @third_restaurant
@eleven_dish.save!
@twelve_dish = Dish.new(name: "Cappuccino", todays_special: false, description: "Italian Style", category: "Hot Beverages", price: 3)
@twelve_dish.restaurant = @third_restaurant
@twelve_dish.save!
@thirteen_dish = Dish.new(name: "Latte Macchiato", todays_special: false, description: "Italian Style", category: "Hot Beverages", price: 3)
@thirteen_dish.restaurant = @third_restaurant
@thirteen_dish.save!
@fourteen_dish = Dish.new(name: "Black Tea", todays_special: false, description: "Freshly Brewed", category: "Hot Beverages", price: 2.5)
@fourteen_dish.restaurant = @third_restaurant
@fourteen_dish.save!
@fifteen_dish = Dish.new(name: "Green Tea", todays_special: false, description: "Freshly Brewed", category: "Hot Beverages", price: 2.5)
@fifteen_dish.restaurant = @third_restaurant
@fifteen_dish.save!

@sixteen_dish = Dish.new(name: "Picanha", todays_special: true, description: "The best cut of beef", category: "Meat", price: "10")
@sixteen_dish.restaurant = @fourth_restaurant
@sixteen_dish.save!
@seventeen_dish = Dish.new(name: "Coxo de frango", todays_special: false, description: "Chicken legs", category: "Meat", price: "8")
@seventeen_dish.restaurant = @fourth_restaurant
@seventeen_dish.save!
@eighteen_dish = Dish.new(name: "Lombo de porco", todays_special: false, description: "Pork neck", category: "Meat", price: "8")
@eighteen_dish.restaurant = @fourth_restaurant
@eighteen_dish.save!
@nineteen_dish = Dish.new(name: "Cameiro", todays_special: false, description: "Lamb meat", category: "Meat", price: "9")
@nineteen_dish.restaurant = @fourth_restaurant
@nineteen_dish.save!
@twenty_dish = Dish.new(name: "Pudim de leite condensado", todays_special: true, description: "Homemade pudding made from condensed milk.", category: "Dessert", price: "5")
@twenty_dish.restaurant = @fourth_restaurant
@twenty_dish.save!

@twentyone_dish = Dish.new(name: "Classic Burger", todays_special: false, description: "Fresh grilled beef, cheddar cheese, cucumber relish, tomatoes, lettuce, onions, sauce.", category: "Meat", price: "7")
@twentyone_dish.restaurant = @fifth_restaurant
@twentyone_dish.save!
@twentytwo_dish = Dish.new(name: "Chicken Burger", todays_special: false, description: "Fresh grilled chicken, cheddar cheese, lettuce, tomatoes, onions, sauce.", category: "Meat", price: "8")
@twentytwo_dish.restaurant = @fifth_restaurant
@twentytwo_dish.save!
@twentythree_dish = Dish.new(name: "Bacon Burger", todays_special: true, description: "Fresh beef, cheddar cheese, grilled bacon, caramelized onions, lettuce, smokey sauce.", category: "Meat", price: "9")
@twentythree_dish.restaurant = @fifth_restaurant
@twentythree_dish.save!
@twentyfour_dish = Dish.new(name: "Avocado Burger", todays_special: true, description: "Fresh grilled beef, cheddar cheese, avocado, tomatoes, lettuce, onions, sauce.", category: "Meat", price: "8")
@twentyfour_dish.restaurant = @fifth_restaurant
@twentyfour_dish.save!
@twentyfive_dish = Dish.new(name: "Veggie", todays_special: true, description: "Cheddar cheese, mushrooms, grilled eggplant, tomatoes, lettuce, onions, sauce.", category: "Vegetarian", price: "8")
@twentyfive_dish.restaurant = @fifth_restaurant
@twentyfive_dish.save!
puts "#{Dish.count} dishes were created."
