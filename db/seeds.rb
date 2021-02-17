# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

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

puts "Creating dishes..."
@first_dish = Dish.new(name: "Single Malt Whisky", todays_special: true, description: "Impresses with its full, fruity aroma.", category: "Alcoholic Beverages", price: 8)
@first_dish.restaurant = @first_restaurant
first_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg')
@first_dish.photo.attach(io: first_dish, filename: 'first_dish image', content_type: 'image/jpg')
@first_dish.save!

@second_dish = Dish.new(name: "Blended Malt Whisky", todays_special: false, description: "Impresses with its peppery spiciness.", category: "Alcoholic Beverages", price: 10)
@second_dish.restaurant = @first_restaurant
second_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227902/whisky3_cevtps.jpg')
@second_dish.photo.attach(io: second_dish, filename: 'second_dish image', content_type: 'image/jpg')
@second_dish.save!

@third_dish = Dish.new(name: "Scotch Whisky", todays_special: false, description: "Impresses with its sweet vanilla notes.", category: "Alcoholic Beverages", price: 8)
@third_dish.restaurant = @first_restaurant
third_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227902/whisky2_ajkcu5.jpg')
@third_dish.photo.attach(io: third_dish, filename: 'third_dish image', content_type: 'image/jpg')
@third_dish.save!

@fourth_dish = Dish.new(name: "Tennessee Whisky", todays_special: false, description: "Impresses with its dry and spicy aroma.", category: "Alcoholic Beverages", price: 9)
@fourth_dish.restaurant = @first_restaurant
fourth_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg')
@fourth_dish.photo.attach(io: fourth_dish, filename: 'fourth_dish image', content_type: 'image/jpg')
@fourth_dish.save!

@fifth_dish = Dish.new(name: "Bourbon", todays_special: false, description: "Impresses with its characteristic nutty flavours.", category: "Alcoholic Beverages", price: 11)
@fifth_dish.restaurant = @first_restaurant
fifth_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227902/whisky3_cevtps.jpg')
@fifth_dish.photo.attach(io: fifth_dish, filename: 'fifth_dish image', content_type: 'image/jpg')
@fifth_dish.save!

@six_dish = Dish.new(name: "Bigos", todays_special: true, description: "Stew of chopped meat, sauerkraut and fresh shredded cabbage.", category: "Soups", price: 10)
@six_dish.restaurant = @second_restaurant
six_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613233162/stew_kpeqvs.jpg')
@six_dish.photo.attach(io: six_dish, filename: 'six_dish image', content_type: 'image/jpg')
@six_dish.save!

@seven_dish = Dish.new(name: "Pierogi", todays_special: false, description: "Stuffed dumplings with savoury filling.", category: "Starters", price: 8)
@seven_dish.restaurant = @second_restaurant
seven_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613233162/stew_kpeqvs.jpg')
@seven_dish.photo.attach(io: seven_dish, filename: 'seven_dish image', content_type: 'image/jpg')
@seven_dish.save!

@eight_dish = Dish.new(name: "Cucumber Soup", todays_special: false, description: "Traditional Polish soup made from sour, salted cucumbers and potato.", category: "Soups", price: 8)
@eight_dish.restaurant = @second_restaurant
eight_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613233162/stew_kpeqvs.jpg')
@eight_dish.photo.attach(io: eight_dish, filename: 'eight_dish image', content_type: 'image/jpg')
@eight_dish.save!

@nine_dish = Dish.new(name: "Vodka", todays_special: false, description: "Traditional Polish digestif.", category: "Alcoholic Beverages", price: 5)
@nine_dish.restaurant = @second_restaurant
nine_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227902/whisky3_cevtps.jpg')
@nine_dish.photo.attach(io: nine_dish, filename: 'nine_dish image', content_type: 'image/jpg')
@nine_dish.save!

@ten_dish = Dish.new(name: "Borscht", todays_special: false, description: "Sour soup made with beetroots, which give the dish its distinctive red color.", category: "Soups", price: 10)
@ten_dish.restaurant = @second_restaurant
ten_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613233162/stew_kpeqvs.jpg')
@ten_dish.photo.attach(io: ten_dish, filename: 'ten_dish image', content_type: 'image/jpg')
@ten_dish.save!

@eleven_dish = Dish.new(name: "Espresso", todays_special: false, description: "Italian Style", category: "Hot Beverages", price: 2)
@eleven_dish.restaurant = @third_restaurant
eleven_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg')
@eleven_dish.photo.attach(io: eleven_dish, filename: 'eleven_dish image', content_type: 'image/jpg')
@eleven_dish.save!

@twelve_dish = Dish.new(name: "Cappuccino", todays_special: false, description: "Italian Style", category: "Hot Beverages", price: 3)
@twelve_dish.restaurant = @third_restaurant
twelve_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg')
@twelve_dish.photo.attach(io: twelve_dish, filename: 'twelve_dish image', content_type: 'image/jpg')
@twelve_dish.save!

@thirteen_dish = Dish.new(name: "Latte Macchiato", todays_special: false, description: "Italian Style", category: "Hot Beverages", price: 3)
@thirteen_dish.restaurant = @third_restaurant
thirteen_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg')
@thirteen_dish.photo.attach(io: thirteen_dish, filename: 'thirteen_dish image', content_type: 'image/jpg')
@thirteen_dish.save!

@fourteen_dish = Dish.new(name: "Black Tea", todays_special: false, description: "Freshly Brewed", category: "Hot Beverages", price: 2.5)
@fourteen_dish.restaurant = @third_restaurant
fourteen_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232260/tea_alecuf.jpg')
@fourteen_dish.photo.attach(io: fourteen_dish, filename: 'fourteen_dish image', content_type: 'image/jpg')
@fourteen_dish.save!

@fifteen_dish = Dish.new(name: "Green Tea", todays_special: false, description: "Freshly Brewed", category: "Hot Beverages", price: 2.5)
@fifteen_dish.restaurant = @third_restaurant
fifteen_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232260/tea_alecuf.jpg')
@fifteen_dish.photo.attach(io: fifteen_dish, filename: 'fifteen_dish image', content_type: 'image/jpg')
@fifteen_dish.save!

@sixteen_dish = Dish.new(name: "Picanha", todays_special: true, description: "The best cut of beef", category: "Meat", price: "10")
@sixteen_dish.restaurant = @fourth_restaurant
sixteen_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg')
@sixteen_dish.photo.attach(io: sixteen_dish, filename: 'sixteen_dish image', content_type: 'image/jpg')
@sixteen_dish.save!

@seventeen_dish = Dish.new(name: "Coxo de frango", todays_special: false, description: "Chicken legs", category: "Meat", price: "8")
@seventeen_dish.restaurant = @fourth_restaurant
seventeen_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg')
@seventeen_dish.photo.attach(io: seventeen_dish, filename: 'seventeen_dish image', content_type: 'image/jpg')
@seventeen_dish.save!

@eighteen_dish = Dish.new(name: "Lombo de porco", todays_special: false, description: "Pork neck", category: "Meat", price: "8")
@eighteen_dish.restaurant = @fourth_restaurant
eighteen_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg')
@eighteen_dish.photo.attach(io: eighteen_dish, filename: 'eighteen_dish image', content_type: 'image/jpg')
@eighteen_dish.save!

@nineteen_dish = Dish.new(name: "Cameiro", todays_special: false, description: "Lamb meat", category: "Meat", price: "9")
@nineteen_dish.restaurant = @fourth_restaurant
nineteen_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg')
@nineteen_dish.photo.attach(io: nineteen_dish, filename: 'nineteen_dish image', content_type: 'image/jpg')
@nineteen_dish.save!

@twenty_dish = Dish.new(name: "Pudim de leite condensado", todays_special: true, description: "Homemade pudding made from condensed milk.", category: "Desserts", price: "5")
@twenty_dish.restaurant = @fourth_restaurant
twenty_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232983/dessert_rl2615.jpg')
@twenty_dish.photo.attach(io: twenty_dish, filename: 'twenty_dish image', content_type: 'image/jpg')
@twenty_dish.save!

@twentyone_dish = Dish.new(name: "Classic Burger", todays_special: false, description: "Fresh grilled beef, cheddar cheese, cucumber relish, tomatoes, lettuce, onions, sauce.", category: "Meat", price: "7")
@twentyone_dish.restaurant = @fifth_restaurant
twentyone_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232602/burger_msqv0h.jpg')
@twentyone_dish.photo.attach(io: twentyone_dish, filename: 'twentyone_dish image', content_type: 'image/jpg')
@twentyone_dish.save!

@twentytwo_dish = Dish.new(name: "Chicken Burger", todays_special: false, description: "Fresh grilled chicken, cheddar cheese, lettuce, tomatoes, onions, sauce.", category: "Meat", price: "8")
@twentytwo_dish.restaurant = @fifth_restaurant
twentytwo_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232602/burger_msqv0h.jpg')
@twentytwo_dish.photo.attach(io: twentytwo_dish, filename: 'twentytwo_dish image', content_type: 'image/jpg')
@twentytwo_dish.save!

@twentythree_dish = Dish.new(name: "Bacon Burger", todays_special: true, description: "Fresh beef, cheddar cheese, grilled bacon, caramelized onions, lettuce, smokey sauce.", category: "Meat", price: "9")
@twentythree_dish.restaurant = @fifth_restaurant
twentythree_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232602/burger_msqv0h.jpg')
@twentythree_dish.photo.attach(io: twentythree_dish, filename: 'twentythree_dish image', content_type: 'image/jpg')
@twentythree_dish.save!

@twentyfour_dish = Dish.new(name: "Avocado Burger", todays_special: true, description: "Fresh grilled beef, cheddar cheese, avocado, tomatoes, lettuce, onions, sauce.", category: "Meat", price: "8")
@twentyfour_dish.restaurant = @fifth_restaurant
twentyfour_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232602/burger_msqv0h.jpg')
@twentyfour_dish.photo.attach(io: twentyfour_dish, filename: 'twentyfour_dish image', content_type: 'image/jpg')
@twentyfour_dish.save!

@twentyfive_dish = Dish.new(name: "Veggie", todays_special: true, description: "Cheddar cheese, mushrooms, grilled eggplant, tomatoes, lettuce, onions, sauce.", category: "Vegetarian", price: "8")
@twentyfive_dish.restaurant = @fifth_restaurant
twentyfive_dish = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232602/burger_msqv0h.jpg')
@twentyfive_dish.photo.attach(io: twentyfive_dish, filename: 'twentyfive_dish image', content_type: 'image/jpg')
@twentyfive_dish.save!
puts "#{Dish.count}/25 dishes were created."

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
puts "#{Visit.count}/12 visits were created."

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
puts "#{Visit.count}/12 visits were created."

# 6. ORDERS

puts "Creating orders..."
@visits_first_restaurant = []
Restaurant.first.tables.each {|table| @visits_first_restaurant << table.visits}
@dishes_first_restaurant = Restaurant.first.dishes
10.times {Order.create!(status: 0, visit: @visits_first_restaurant.flatten.sample, dish: @dishes_first_restaurant.sample)}

@visits_second_restaurant = []
Restaurant.second.tables.each {|table| @visits_second_restaurant << table.visits}
@dishes_second_restaurant = Restaurant.second.dishes
10.times {Order.create!(status: 0, visit: @visits_second_restaurant.flatten.sample, dish: @dishes_second_restaurant.sample)}

@visits_third_restaurant = []
Restaurant.third.tables.each {|table| @visits_third_restaurant << table.visits}
@dishes_third_restaurant = Restaurant.third.dishes
10.times {Order.create!(status: 0, visit: @visits_third_restaurant.flatten.sample, dish: @dishes_third_restaurant.sample)}

@visits_fourth_restaurant = []
Restaurant.fourth.tables.each {|table| @visits_fourth_restaurant << table.visits}
@dishes_fourth_restaurant = Restaurant.fourth.dishes
10.times {Order.create!(status: 0, visit: @visits_fourth_restaurant.flatten.sample, dish: @dishes_fourth_restaurant.sample)}

@visits_fifth_restaurant = []
Restaurant.fifth.tables.each {|table| @visits_fifth_restaurant << table.visits}
@dishes_fifth_restaurant = Restaurant.fifth.dishes
10.times {Order.create!(status: 0, visit: @visits_fifth_restaurant.flatten.sample, dish: @dishes_fifth_restaurant.sample)}
puts "#{Order.count}/50 orders were created."
