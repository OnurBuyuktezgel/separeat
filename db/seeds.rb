# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'faker'

Review.destroy_all
puts "All reviews were deleted"

Order.destroy_all
puts "All orders were deleted"

Visit.destroy_all
puts "All visits were deleted"

Dish.destroy_all
puts "All dishes were deleted"

Table.destroy_all
puts "All tables were deleted"

Restaurant.destroy_all
puts "All restaurants were deleted"

User.destroy_all
puts "All users were deleted"

# 1. USERS

puts "Creating users..."
@first_user = User.create!(email: "onur@separeat.com", password: "12345678", first_name: "Onur", last_name: "B", address: "Cologne", phone: "0049 0121 0121", user_type: 'Restaurant Owner')
first_user = URI.open('https://kitt.lewagon.com/placeholder/users/onurbuyuktezgel')
@first_user.photo.attach(io: first_user, filename: 'first_user image', content_type: 'image/jpg')

@second_user = User.create!(email: "ilona@separeat.com", password: "12345678", first_name: "Ilona", last_name: "D", address: "Vienna", phone: "0043 0123 0123", user_type: 'Restaurant Owner')
second_user = URI.open('https://kitt.lewagon.com/placeholder/users/ilona-dvorak')
@second_user.photo.attach(io: second_user, filename: 'second_user image', content_type: 'image/jpg')

@third_user = User.create!(email: "malin@separeat.com", password: "12345678", first_name: "Malin", last_name: "S", address: "Duesseldorf", phone: "0049 0123 0123", user_type: 'Restaurant Owner')
third_user = URI.open('https://kitt.lewagon.com/placeholder/users/malin101')
@third_user.photo.attach(io: third_user, filename: 'third_user image', content_type: 'image/jpg')

@fourth_user = User.create!(email: "andre@separeat.com", password: "12345678", first_name: "Andre", last_name: "F", address: "Rio de Janeiro", phone: "0055 2121 2121", user_type: 'Restaurant Owner')
fourth_user = URI.open('https://kitt.lewagon.com/placeholder/users/tonipanacek')
@fourth_user.photo.attach(io: fourth_user, filename: 'fourth_user image', content_type: 'image/jpg')

@fifth_user = User.create!(email: "toni@separeat.com", password: "12345678", first_name: "Toni", last_name: "P", address: "Berlin", phone: "0049 0125 0125", user_type: 'Restaurant Owner')
fifth_user = URI.open('https://kitt.lewagon.com/placeholder/users/andrerferrer')
@fifth_user.photo.attach(io: fifth_user, filename: 'fifth_user image', content_type: 'image/jpg')

@user_six = User.create!(email: "peter@user.com", password: "12345678", first_name: "Peter", last_name: "H", address: "Madrid", phone: "123 456 789", user_type: 'Customer')
@user_seven = User.create!(email: "karl@user.com", password: "12345678", first_name: "Karl", last_name: "K", address: "Munich", phone: "123 456 789", user_type: 'Customer')
@user_eight = User.create!(email: "cagri@user.com", password: "12345678", first_name: "Cagri", last_name: "H", address: "Copenhagen", phone: "123 456 789", user_type: 'Customer')
@user_nine = User.create!(email: "lena@user.com", password: "12345678", first_name: "Lena", last_name: "L", address: "Cologne", phone: "123 456 789", user_type: 'Customer')
@user_ten = User.create!(email: "karlotta@user.com", password: "12345678", first_name: "Karlotta", last_name: "K", address: "Munich", phone: "123 456 789", user_type: 'Customer')
@user_eleven = User.create!(email: "yannik@user.com", password: "12345678", first_name: "Yannik", last_name: "G", address: "Munich", phone: "123 456 789", user_type: 'Customer')
@user_twelve = User.create!(email: "mark@user.com", password: "12345678", first_name: "Mark", last_name: "M", address: "Berlin", phone: "123 456 789", user_type: 'Customer')
puts "#{User.count}/12 users were created."

# 2. RESTAURANTS

puts "Creating restaurants..."
@first_restaurant = Restaurant.new(name: "Onur's Bar", address: "Cologne", email: "onur@separeat.com", phone: "0049 0121 0121", category: "Bar")
@first_restaurant.user = @first_user
first_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1611082720/iglhfrssj6jcvwzs45og.jpg')
@first_restaurant.photo.attach(io: first_restaurant, filename: 'first_restaurant image', content_type: 'image/jpg')
@first_restaurant.save!

@second_restaurant = Restaurant.new(name: "Ilona's Restaurant", address: "Vienna", email: "ilona@separeat.com", phone: "0043 0123 0123", category: "Polish")
@second_restaurant.user = @second_user
second_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224665/restaurant_ncd9th.jpg')
@second_restaurant.photo.attach(io: second_restaurant, filename: 'second_restaurant image', content_type: 'image/jpg')
@second_restaurant.save!

@third_restaurant = Restaurant.new(name: "Malin's Café", address: "Duesseldorf", email: "malin@separeat.com", phone: "0049 0123 0123", category: "Café")
@third_restaurant.user = @third_user
third_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224663/cafe_ubn02s.jpg')
@third_restaurant.photo.attach(io: third_restaurant, filename: 'third_restaurant image', content_type: 'image/jpg')
@third_restaurant.save!

@fourth_restaurant = Restaurant.new(name: "Andre's Grill", address: "Rio de Janeiro", email: "andre@separeat.com", phone: "0055 2121 2121", category: "Brazilian")
@fourth_restaurant.user = @fourth_user
fourth_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224779/grill_ldo7v1.jpg')
@fourth_restaurant.photo.attach(io: fourth_restaurant, filename: 'fourth_restaurant image', content_type: 'image/jpg')
@fourth_restaurant.save!

@fifth_restaurant = Restaurant.new(name: "Toni's Burgers", address: "Berlin", email: "toni@separeat.com", phone: "0049 0125 0125", category: "Burgers")
@fifth_restaurant.user = @fifth_user
fifth_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224930/burger_xlpnxs.jpg')
@fifth_restaurant.photo.attach(io: fifth_restaurant, filename: 'fifth_restaurant image', content_type: 'image/jpg')
@fifth_restaurant.save!
puts "#{Restaurant.count}/5 restaurants were created."

# 3. TABLES

puts "Creating tables..."
@table_one = Table.new(name: "Table 1", capacity: 4)
@table_one.restaurant = @first_restaurant
@table_one.save

@table_two = Table.new(name: "Table 2", capacity: 2)
@table_two.restaurant = @first_restaurant
@table_two.save

@table_three = Table.new(name: "Table 3", capacity: 6)
@table_three.restaurant = @first_restaurant
@table_three.save

@table_four = Table.new(name: "Table 1", capacity: 4)
@table_four.restaurant = @second_restaurant
@table_four.save

@table_five = Table.new(name: "Table 2", capacity: 2)
@table_five.restaurant = @second_restaurant
@table_five.save

@table_six = Table.new(name: "Table 3", capacity: 6)
@table_six.restaurant = @second_restaurant
@table_six.save

@table_seven = Table.new(name: "Table 1", capacity: 4)
@table_seven.restaurant = @third_restaurant
@table_seven.save

@table_eight = Table.new(name: "Table 2", capacity: 2)
@table_eight.restaurant = @third_restaurant
@table_eight.save

@table_nine = Table.new(name: "Table 3", capacity: 6)
@table_nine.restaurant = @third_restaurant
@table_nine.save

@table_ten = Table.new(name: "Table 1", capacity: 4)
@table_ten.restaurant = @fourth_restaurant
@table_ten.save

@table_eleven = Table.new(name: "Table 2", capacity: 2)
@table_eleven.restaurant = @fourth_restaurant
@table_eleven.save

@table_twelve = Table.new(name: "Table 3", capacity: 6)
@table_twelve.restaurant = @fourth_restaurant
@table_twelve.save

@table_thirteen = Table.new(name: "Table 1", capacity: 4)
@table_thirteen.restaurant = @fifth_restaurant
@table_thirteen.save

@table_fourteen = Table.new(name: "Table 2", capacity: 2)
@table_fourteen.restaurant = @fifth_restaurant
@table_fourteen.save

@table_fifteen = Table.new(name: "Table 3", capacity: 6)
@table_fifteen.restaurant = @fifth_restaurant
@table_fifteen.save
puts "#{Table.count}/15 tables were created."

# 4. DISHES

# DISH IMAGES:
# bev = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614074020/lemonades_aklffr.jpg')
# hot_bev = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg')
# drink = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg')
# beer = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614074017/beers_emlju1.jpg')
# starter = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613902681/starter_uamkpu.jpg')
# main = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613903061/main_gognsl.jpg')
# dessert = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613902675/dessert_pzosgr.jpg')
# burger = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232602/burger_msqv0h.jpg')
# meat = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg')

puts "Creating dishes..."
first_dish = Dish.new(name: "Single Malt Whisky", todays_special: false, description: "Full, fruity aroma.", category: "Alcoholic Beverages", price: [5.5, 7.5, 9].sample, restaurant: @first_restaurant)
first_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'drinks image', content_type: 'image/jpg')
first_dish.save!

second_dish = Dish.new(name: "Blended Malt Whisky", todays_special: false, description: "Peppery spiciness.", category: "Alcoholic Beverages", price: [5.5, 7.5, 9].sample, restaurant: @first_restaurant)
second_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'second_dish image', content_type: 'image/jpg')
second_dish.save!

third_dish = Dish.new(name: "Scotch Whisky", todays_special: false, description: "Sweet vanilla notes.", category: "Alcoholic Beverages", price: [5.5, 7.5, 9].sample, restaurant: @first_restaurant)
third_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'drinks image', content_type: 'image/jpg')
third_dish.save!

fourth_dish = Dish.new(name: "Tennessee Whisky", todays_special: false, description: "Dry and spicy aroma.", category: "Alcoholic Beverages", price: [5.5, 7.5, 9].sample, restaurant: @first_restaurant)
fourth_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'drinks image', content_type: 'image/jpg')
fourth_dish.save!

fifth_dish = Dish.new(name: "Bourbon", todays_special: false, description: "Characteristic nutty flavour.", category: "Alcoholic Beverages", price: [5.5, 7.5, 9].sample, restaurant: @first_restaurant)
fifth_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'drinks image', content_type: 'image/jpg')
fifth_dish.save!

six_dish = Dish.new(name: "Dish 1", todays_special: false, description: Faker::Food.description, category: "Starters", price: [8, 9, 10].sample.to_f, restaurant: @second_restaurant)
six_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613902681/starter_uamkpu.jpg'), filename: 'starters image', content_type: 'image/jpg')
six_dish.save!

seven_dish = Dish.new(name: "Dish 2", todays_special: false, description: Faker::Food.description, category: "Starters", price: [8, 9, 10].sample.to_f, restaurant: @second_restaurant)
seven_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613902681/starter_uamkpu.jpg'), filename: 'starters image', content_type: 'image/jpg')
seven_dish.save!

eight_dish = Dish.new(name: "Dish 3", todays_special: false, description: Faker::Food.description, category: "Main Dishes", price: [11, 13, 15].sample.to_f, restaurant: @second_restaurant)
eight_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613903061/main_gognsl.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
eight_dish.save!

nine_dish = Dish.new(name: "Dish 4", todays_special: false, description: Faker::Food.description, category: "Main Dishes", price: [11, 13, 15].sample.to_f, restaurant: @second_restaurant)
nine_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613903061/main_gognsl.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
nine_dish.save!

ten_dish = Dish.new(name: "Dish 5", todays_special: false, description: Faker::Food.description, category: "Main Dishes", price: [11, 13, 15].sample.to_f, restaurant: @second_restaurant)
ten_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613903061/main_gognsl.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
ten_dish.save!

eleven_dish = Dish.new(name: "Coffe 1", todays_special: false, description: Faker::Coffee.notes, category: "Hot Beverages", price: [2.5, 3, 3.5].sample.to_f, restaurant: @third_restaurant)
eleven_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
eleven_dish.save!

twelve_dish = Dish.new(name: "Coffe 2", todays_special: false, description: Faker::Coffee.notes, category: "Hot Beverages", price: [2.5, 3, 3.5].sample.to_f, restaurant: @third_restaurant)
twelve_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
twelve_dish.save!

thirteen_dish = Dish.new(name: "Coffe 3", todays_special: false, description: Faker::Coffee.notes, category: "Hot Beverages", price: [2.5, 3, 3.5].sample.to_f, restaurant: @third_restaurant)
thirteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
thirteen_dish.save!

fourteen_dish = Dish.new(name: "Coffe 4", todays_special: false, description: Faker::Coffee.notes, category: "Hot Beverages", price: [2.5, 3, 3.5].sample.to_f, restaurant: @third_restaurant)
fourteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
fourteen_dish.save!

fifteen_dish = Dish.new(name: "Coffe 5", todays_special: false, description: Faker::Coffee.notes, category: "Hot Beverages", price: [2.5, 3, 3.5].sample.to_f, restaurant: @third_restaurant)
fifteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
fifteen_dish.save!

sixteen_dish = Dish.new(name: "Picanha", todays_special: true, description: "The best cut of beef", category: "Meat", price: 10, restaurant: @fourth_restaurant)
sixteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg'), filename: 'meat image', content_type: 'image/jpg')
sixteen_dish.save!

seventeen_dish = Dish.new(name: "Coxo de frango", todays_special: false, description: "Chicken legs", category: "Meat", price: 8, restaurant: @fourth_restaurant)
seventeen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg'), filename: 'meat image', content_type: 'image/jpg')
seventeen_dish.save!

eighteen_dish = Dish.new(name: "Lombo de porco", todays_special: false, description: "Pork neck", category: "Meat", price: 8, restaurant: @fourth_restaurant)
eighteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg'), filename: 'meat image', content_type: 'image/jpg')
eighteen_dish.save!

nineteen_dish = Dish.new(name: "Cameiro", todays_special: false, description: "Lamb meat", category: "Meat", price: 10, restaurant: @fourth_restaurant)
nineteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg'), filename: 'meat image', content_type: 'image/jpg')
nineteen_dish.save!

twenty_dish = Dish.new(name: "Pudim de leite condensado", todays_special: true, description: "Homemade pudding made from condensed milk.", category: "Desserts", price: 4.5, restaurant: @fourth_restaurant)
twenty_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162811/separeat/dessert_2.jpg'), filename: 'desserts image', content_type: 'image/jpg')
twenty_dish.save!

twentyone_dish = Dish.new(name: "Classic Burger", todays_special: false, description: "Fresh grilled beef, cheddar cheese, cucumber relish, tomatoes, lettuce, onions, sauce.", category: "Main Dishes", price: 8, restaurant: @fifth_restaurant)
twentyone_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161319/separeat/burger_1.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentyone_dish.save!

twentytwo_dish = Dish.new(name: "Chicken Burger", todays_special: false, description: "Fresh grilled chicken, cheddar cheese, lettuce, tomatoes, onions, sauce.", category: "Main Dishes", price: 10, restaurant: @fifth_restaurant)
twentytwo_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614163838/separeat/chicken-burger.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentytwo_dish.save!

twentythree_dish = Dish.new(name: "Bacon Burger", todays_special: false, description: "Fresh beef, cheddar cheese, grilled bacon, caramelized onions, lettuce, smokey sauce.", category: "Main Dishes", price: 10, restaurant: @fifth_restaurant)
twentythree_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161258/separeat/bacon-burger.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentythree_dish.save!

twentyfour_dish = Dish.new(name: "Avocado Burger", todays_special: false, description: "Fresh grilled beef, cheddar cheese, avocado, tomatoes, lettuce, onions, sauce.", category: "Main Dishes", price: 9.5, restaurant: @fifth_restaurant)
twentyfour_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162374/separeat/burger_2.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentyfour_dish.save!

twentyfive_dish = Dish.new(name: "Veggie Burger", todays_special: false, description: "Cheddar cheese, mushrooms, grilled eggplant, tomatoes, lettuce, onions, sauce.", category: "Main Dishes", price: 9.5, restaurant: @fifth_restaurant)
twentyfive_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161205/separeat/veggie-burger.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentyfive_dish.save!

twentysix_dish = Dish.new(name: 'Garden Salad', todays_special: false, description: Faker::Food.description, category: "Starters", price: [5, 5.5, 6, 6.5, 7].sample, restaurant: @fifth_restaurant)
twentysix_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614165065/separeat/garden-salad.jpg'), filename: 'starters image', content_type: 'image/jpg')
twentysix_dish.save!

twentyseven_dish = Dish.new(name: 'Ceasar Salad', todays_special: false, description: Faker::Food.description, category: "Starters", price: [5, 5.5, 6, 6.5, 7].sample, restaurant: @fifth_restaurant)
twentyseven_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614160924/separeat/ceasar-salad.jpg'), filename: 'starters image', content_type: 'image/jpg')
twentyseven_dish.save!

twentyeight_dish = Dish.new(name: 'Tomato Soup', todays_special: false, description: Faker::Food.description, category: "Starters", price: [5, 5.5, 6, 6.5, 7].sample, restaurant: @fifth_restaurant)
twentyeight_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614160974/separeat/tomato-soup.jpg'), filename: 'starters image', content_type: 'image/jpg')
twentyeight_dish.save!

twentynine_dish = Dish.new(name: 'Toni\'s Homemade Pizza', todays_special: false, description: Faker::Food.description, category: "Main Dishes", price: [8, 9, 10, 11, 12].sample, restaurant: @fifth_restaurant)
twentynine_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161333/separeat/pizza.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
twentynine_dish.save!

thirty_dish = Dish.new(name: 'Toni\'s Famous Mac\'n\'Cheese', todays_special: false, description: Faker::Food.description, category: "Main Dishes", price: [8, 9, 10, 11, 12].sample, restaurant: @fifth_restaurant)
thirty_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161541/separeat/macncheese.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
thirty_dish.save!

thirtyone_dish = Dish.new(name: 'Ice Cream', todays_special: false, description: "#{Faker::Dessert.flavor} & #{Faker::Dessert.topping}", category: "Desserts", price: [4, 4.5, 5, 5.5].sample, restaurant: @fifth_restaurant)
thirtyone_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162631/separeat/dessert_1.jpg'), filename: 'desserts image', content_type: 'image/jpg')
thirtyone_dish.save!

thirtytwo_dish = Dish.new(name: 'Pudding', todays_special: false, description: "#{Faker::Dessert.flavor} & #{Faker::Dessert.topping}", category: "Desserts", price: [4, 4.5, 5, 5.5].sample, restaurant: @fifth_restaurant)
thirtytwo_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162811/separeat/dessert_2.jpg'), filename: 'desserts image', content_type: 'image/jpg')
thirtytwo_dish.save!

thirtythree_dish = Dish.new(name: 'Cake', todays_special: false, description: "#{Faker::Dessert.flavor} & #{Faker::Dessert.topping}", category: "Desserts", price: [4, 4.5, 5, 5.5].sample, restaurant: @fifth_restaurant)
thirtythree_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1611076593/samples/food/dessert.jpg'), filename: 'desserts image', content_type: 'image/jpg')
thirtythree_dish.save!

thirtyfour_dish = Dish.new(name: "Pils", todays_special: false, description: Faker::Beer.style, category: "Beers", price: [3.5, 4, 4.5, 5].sample, restaurant: @fifth_restaurant)
thirtyfour_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162249/separeat/beer_1.jpg'), filename: 'beers image', content_type: 'image/jpg')
thirtyfour_dish.save!

thirtyfive_dish = Dish.new(name: "Hefeweizen", todays_special: false, description: Faker::Beer.style, category: "Beers", price: [3.5, 4, 4.5, 5].sample, restaurant: @fifth_restaurant)
thirtyfive_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161422/separeat/beer_2.jpg'), filename: 'beers image', content_type: 'image/jpg')
thirtyfive_dish.save!

thirtysix_dish = Dish.new(name: "Espresso", todays_special: false, description: Faker::Coffee.notes, category: "Hot Beverages", price: [2.5, 3, 3.5].sample.to_f, restaurant: @fifth_restaurant)
thirtysix_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162704/separeat/coffee_1.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
thirtysix_dish.save!

thirtyseven_dish = Dish.new(name: "Capuccino", todays_special: false, description: Faker::Coffee.notes, category: "Hot Beverages", price: [2.5, 3, 3.5].sample.to_f, restaurant: @fifth_restaurant)
thirtyseven_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614163137/separeat/coffee_2.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
thirtyseven_dish.save!

# thirtyeight_dish = Dish.new(name: 'Still Water', todays_special: false, description: '0.33 l', category: "Beverages", price: 2.5, restaurant: @fifth_restaurant)
# thirtyeight_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161122/separeat/mineral-water.jpg'), filename: 'bevs image', content_type: 'image/jpg')
# thirtyeight_dish.save!

thirtynine_dish = Dish.new(name: 'Sparkling Water', todays_special: false, description: '0.33 l', category: "Beverages", price: 2.5, restaurant: @fifth_restaurant)
thirtynine_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161122/separeat/mineral-water.jpg'), filename: 'bevs image', content_type: 'image/jpg')
thirtynine_dish.save!

fourty_dish = Dish.new(name: 'Apple Juice', todays_special: false, description: '0.33 l', category: "Beverages", price: 3.5, restaurant: @fifth_restaurant)
fourty_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614163235/separeat/lemonade.jpg'), filename: 'bevs image', content_type: 'image/jpg')
fourty_dish.save!

# fourtyone_dish = Dish.new(name: 'Apfelschorle', todays_special: false, description: '0.33 l', category: "Beverages", price: 3.5, restaurant: @fifth_restaurant)
# fourtyone_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614163235/separeat/lemonade.jpg'), filename: 'bevs image', content_type: 'image/jpg')
# fourtyone_dish.save!

fourtytwo_dish = Dish.new(name: 'Coke', todays_special: false, description: '0.33 l', category: "Beverages", price: 3.5, restaurant: @fifth_restaurant)
fourtytwo_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161053/separeat/coke.jpg'), filename: 'bevs image', content_type: 'image/jpg')
fourtytwo_dish.save!
puts "#{Dish.count}/40 dishes were created."

# 5. VISITS

puts "Creating visits..."
@visit_one = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 3)
@visit_one.user = @user_six
@visit_one.table = @table_one
@visit_one.save!

@visit_two = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 2)
@visit_two.user = @user_seven
@visit_two.table = @table_two
@visit_two.save!

@visit_three = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 5)
@visit_three.user = @user_eight
@visit_three.table = @table_three
@visit_three.save!

@visit_four = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 3)
@visit_four.user = @user_nine
@visit_four.table = @table_four
@visit_four.save!

@visit_five = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 2)
@visit_five.user = @user_ten
@visit_five.table = @table_five
@visit_five.save!

@visit_six = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 5)
@visit_six.user = @user_eleven
@visit_six.table = @table_six
@visit_six.save!

@visit_seven = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 3)
@visit_seven.user = @user_twelve
@visit_seven.table = @table_seven
@visit_seven.save!

@visit_eight = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 2)
@visit_eight.user = @user_six
@visit_eight.table = @table_eight
@visit_eight.save!

@visit_nine = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 5)
@visit_nine.user = @user_seven
@visit_nine.table = @table_nine
@visit_nine.save!

@visit_ten = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 3)
@visit_ten.user = @user_eight
@visit_ten.table = @table_ten
@visit_ten.save!

@visit_eleven = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 2)
@visit_eleven.user = @user_nine
@visit_eleven.table = @table_eleven
@visit_eleven.save!

@visit_twelve = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 5)
@visit_twelve.user = @user_ten
@visit_twelve.table = @table_twelve
@visit_twelve.save!

@visit_thirteen = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 3)
@visit_thirteen.user = @user_eleven
@visit_thirteen.table = @table_thirteen
@visit_thirteen.save!

@visit_fourteen = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 2)
@visit_fourteen.user = @user_twelve
@visit_fourteen.table = @table_fourteen
@visit_fourteen.save!

@visit_fifteen = Visit.new(start_date: "2021-02-12 18:00:00 CET", end_date: "2021-02-12 21:00:00 CET", guests: 5)
@visit_fifteen.user = @user_six
@visit_fifteen.table = @table_fifteen
@visit_fifteen.save!
puts "#{Visit.count}/15 visits were created."

# 6. ORDERS

puts "Creating orders..."
@visits_first_restaurant = []
Restaurant.first.tables.each {|table| @visits_first_restaurant << table.visits}
@dishes_first_restaurant = Restaurant.first.dishes
10.times {Order.create!(status: 0, visit: @visits_first_restaurant.flatten.sample, dish: @dishes_first_restaurant.sample, quantity: [1, 2, 3].sample)}

@visits_second_restaurant = []
Restaurant.second.tables.each {|table| @visits_second_restaurant << table.visits}
@dishes_second_restaurant = Restaurant.second.dishes
10.times {Order.create!(status: 0, visit: @visits_second_restaurant.flatten.sample, dish: @dishes_second_restaurant.sample, quantity: [1, 2, 3].sample)}

@visits_third_restaurant = []
Restaurant.third.tables.each {|table| @visits_third_restaurant << table.visits}
@dishes_third_restaurant = Restaurant.third.dishes
10.times {Order.create!(status: 0, visit: @visits_third_restaurant.flatten.sample, dish: @dishes_third_restaurant.sample, quantity: [1, 2, 3].sample)}

@visits_fourth_restaurant = []
Restaurant.fourth.tables.each {|table| @visits_fourth_restaurant << table.visits}
@dishes_fourth_restaurant = Restaurant.fourth.dishes
10.times {Order.create!(status: 0, visit: @visits_fourth_restaurant.flatten.sample, dish: @dishes_fourth_restaurant.sample, quantity: [1, 2, 3].sample)}

@visits_fifth_restaurant = []
Restaurant.fifth.tables.each {|table| @visits_fifth_restaurant << table.visits}
@dishes_fifth_restaurant = Restaurant.fifth.dishes
10.times {Order.create!(status: 0, visit: @visits_fifth_restaurant.flatten.sample, dish: @dishes_fifth_restaurant.sample, quantity: [1, 2, 3].sample)}
puts "#{Order.count}/50 orders were created."

# 7. REVIEWS

puts "Creating reviews..."
@users = [@user_six, @user_seven, @user_eight, @user_nine, @user_ten, @user_eleven, @user_twelve]
@messages = ["Great Place!", "So good!", "Best food in town!", "Best drinks in town! 🍻", "Really nice place and lovely restaurant owner 💛", "Love this place, highly recommend 👍", "Awesome food – try their burgers! 🤤🍔", "Cool place, but a lot of coders around 🤓🤔"]

3.times {Review.create!(user: @users.sample, restaurant: @first_restaurant, content: @messages.sample, rating: 5)}
3.times {Review.create!(user: @users.sample, restaurant: @second_restaurant, content: @messages.sample, rating: 5)}
3.times {Review.create!(user: @users.sample, restaurant: @third_restaurant, content: @messages.sample, rating: 5)}
3.times {Review.create!(user: @users.sample, restaurant: @fourth_restaurant, content: @messages.sample, rating: 5)}
@messages.each do |message|
  Review.create!(user: @users.sample, restaurant: @fifth_restaurant, content: message, rating: 5)
end
puts "#{Review.count}/20 reviews were created."

# FAKE VISIT FOR DEMO
puts "Creating the demo visit"
@fake_visit = Visit.create!(start_date: "2021-02-22 18:00:00 CET", end_date: "2021-02-22 21:00:00 CET", guests: 5, user: @second_user, table: @table_fifteen)
puts "The demo visit #{@fake_visit} was created."
