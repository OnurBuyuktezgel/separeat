require 'open-uri'
require 'json'

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

@third_user = User.create!(email: "malin@separeat.com", password: "12345678", first_name: "Malin", last_name: "S", address: "Duesseldorf", phone: "0049 0123 0123", user_type: 'Customer')
third_user = URI.open('https://kitt.lewagon.com/placeholder/users/malin101')
@third_user.photo.attach(io: third_user, filename: 'third_user image', content_type: 'image/jpg')

@fourth_user = User.create!(email: "andre@separeat.com", password: "12345678", first_name: "Andre", last_name: "F", address: "Rio de Janeiro", phone: "0055 2121 2121", user_type: 'Restaurant Owner')
fourth_user = URI.open('https://kitt.lewagon.com/placeholder/users/tonipanacek')
@fourth_user.photo.attach(io: fourth_user, filename: 'fourth_user image', content_type: 'image/jpg')

@fifth_user = User.create!(email: "toni@separeat.com", password: "12345678", first_name: "Toni", last_name: "P", address: "Berlin", phone: "0049 0125 0125", user_type: 'Restaurant Owner')
fifth_user = URI.open('https://kitt.lewagon.com/placeholder/users/andrerferrer')
@fifth_user.photo.attach(io: fifth_user, filename: 'fifth_user image', content_type: 'image/jpg')

@lucie = User.create!(email: "lucie@separeat.com", password: "12345678", first_name: "Lucie", last_name: "B", address: "Berlin", phone: "123 456 789", user_type: 'Restaurant Owner')

@user_six = User.create!(email: "peter@user.com", password: "12345678", first_name: "Peter", last_name: "H", address: "Madrid", phone: "123 456 789", user_type: 'Customer')
@user_seven = User.create!(email: "karl@user.com", password: "12345678", first_name: "Karl", last_name: "K", address: "Munich", phone: "123 456 789", user_type: 'Customer')
@user_eight = User.create!(email: "cagri@user.com", password: "12345678", first_name: "Cagri", last_name: "H", address: "Copenhagen", phone: "123 456 789", user_type: 'Customer')
@user_nine = User.create!(email: "lena@user.com", password: "12345678", first_name: "Lena", last_name: "L", address: "Cologne", phone: "123 456 789", user_type: 'Customer')
@user_ten = User.create!(email: "karlotta@user.com", password: "12345678", first_name: "Karlotta", last_name: "K", address: "Munich", phone: "123 456 789", user_type: 'Customer')
@user_eleven = User.create!(email: "yannik@user.com", password: "12345678", first_name: "Yannik", last_name: "G", address: "Munich", phone: "123 456 789", user_type: 'Customer')
@user_twelve = User.create!(email: "mark@user.com", password: "12345678", first_name: "Mark", last_name: "M", address: "Berlin", phone: "123 456 789", user_type: 'Customer')
puts "#{User.count}/13 users were created."

# 2. RESTAURANTS

puts "Creating restaurants..."
@first_restaurant = Restaurant.new(name: "Onur's Bar", address: "Berlin", email: "onur@separeat.com", phone: "0049 0121 0121", category: "Bar", user: @first_user)
first_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615470606/separeat/onurs_bar_miocga.jpg')
@first_restaurant.photo.attach(io: first_restaurant, filename: 'first_restaurant image', content_type: 'image/jpg')
@first_restaurant.save!

@second_restaurant = Restaurant.new(name: "Ilona's Restaurant", address: "Berlin", email: "ilona@separeat.com", phone: "0043 0123 0123", category: "Polish", user: @second_user)
second_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224665/restaurant_ncd9th.jpg')
@second_restaurant.photo.attach(io: second_restaurant, filename: 'second_restaurant image', content_type: 'image/jpg')
@second_restaurant.save!

@third_restaurant = Restaurant.new(name: "Lucie's Café", address: "Berlin", email: "lucie@separeat.com", phone: "0049 0123 0123", category: "Café", user: @lucie)
third_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224663/cafe_ubn02s.jpg')
@third_restaurant.photo.attach(io: third_restaurant, filename: 'third_restaurant image', content_type: 'image/jpg')
@third_restaurant.save!

@fourth_restaurant = Restaurant.new(name: "Andre's Grill", address: "Berlin", email: "andre@separeat.com", phone: "0055 2121 2121", category: "Brazilian", user: @fourth_user)
fourth_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224779/grill_ldo7v1.jpg')
@fourth_restaurant.photo.attach(io: fourth_restaurant, filename: 'fourth_restaurant image', content_type: 'image/jpg')
@fourth_restaurant.save!

@fifth_restaurant = Restaurant.new(name: "Toni's Burgers", address: "Berlin", email: "toni@separeat.com", phone: "0049 0125 0125", category: "Burgers", user: @fifth_user)
fifth_restaurant = URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613224930/burger_xlpnxs.jpg')
@fifth_restaurant.photo.attach(io: fifth_restaurant, filename: 'fifth_restaurant image', content_type: 'image/jpg')
@fifth_restaurant.save!
puts "#{Restaurant.count}/5 restaurants were created."

# 3. TABLES

puts "Creating tables..."
@table_one = Table.create!(name: "Table 1", capacity: 4, restaurant: @first_restaurant)
@table_two = Table.create!(name: "Table 2", capacity: 2, restaurant: @first_restaurant)
@table_three = Table.create!(name: "Table 3", capacity: 6, restaurant: @first_restaurant)
@table_four = Table.create!(name: "Table 1", capacity: 4, restaurant: @second_restaurant)
@table_five = Table.create!(name: "Table 2", capacity: 2, restaurant: @second_restaurant)
@table_six = Table.create!(name: "Table 3", capacity: 6, restaurant: @second_restaurant)
@table_seven = Table.create!(name: "Table 1", capacity: 4, restaurant: @third_restaurant)
@table_eight = Table.create!(name: "Table 2", capacity: 2, restaurant: @third_restaurant)
@table_nine = Table.create!(name: "Table 3", capacity: 6, restaurant: @third_restaurant)
@table_ten = Table.create!(name: "Table 1", capacity: 4, restaurant: @fourth_restaurant)
@table_eleven = Table.create!(name: "Table 2", capacity: 2, restaurant: @fourth_restaurant)
@table_twelve = Table.create!(name: "Table 3", capacity: 6, restaurant: @fourth_restaurant)
@table_thirteen = Table.create!(name: "Table 1", capacity: 4, restaurant: @fifth_restaurant)
@table_fourteen = Table.create!(name: "Table 2", capacity: 2, restaurant: @fifth_restaurant)
@table_fifteen = Table.create!(name: "Table 3", capacity: 6, restaurant: @fifth_restaurant)
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
first_dish = Dish.new(name: "Single Malt", todays_special: false, description: "full & fruity aroma", category: "Alcoholic Beverages", price: [5.50, 7.50, 9.20].sample, restaurant: @first_restaurant)
first_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'drinks image', content_type: 'image/jpg')
first_dish.save!

second_dish = Dish.new(name: "Blended Malt", todays_special: false, description: "peppery spiciness", category: "Alcoholic Beverages", price: [5.50, 7.50, 9.20].sample, restaurant: @first_restaurant)
second_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'second_dish image', content_type: 'image/jpg')
second_dish.save!

third_dish = Dish.new(name: "Scotch", todays_special: false, description: "sweet vanilla notes", category: "Alcoholic Beverages", price: [5.50, 7.50, 9.20].sample, restaurant: @first_restaurant)
third_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'drinks image', content_type: 'image/jpg')
third_dish.save!

fourth_dish = Dish.new(name: "Tennessee", todays_special: false, description: "dry & spicy aroma", category: "Alcoholic Beverages", price: [5.50, 7.50, 9.20].sample, restaurant: @first_restaurant)
fourth_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'drinks image', content_type: 'image/jpg')
fourth_dish.save!

fifth_dish = Dish.new(name: "Bourbon", todays_special: false, description: "characteristic nutty flavours", category: "Alcoholic Beverages", price: [5.50, 7.50, 9.20].sample, restaurant: @first_restaurant)
fifth_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613227908/whisky5_cgpgoa.jpg'), filename: 'drinks image', content_type: 'image/jpg')
fifth_dish.save!

six_dish = Dish.new(name: "Soup", todays_special: false, description: "red & delish", category: "Starters", price: 8.00, restaurant: @second_restaurant)
six_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615458405/separeat/tomato_soup_xg8glt.jpg'), filename: 'starters image', content_type: 'image/jpg')
six_dish.save!

seven_dish = Dish.new(name: "Salad", todays_special: false, description: "fresh & delish", category: "Starters", price: 9.50, restaurant: @second_restaurant)
seven_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614160924/separeat/ceasar-salad.jpg'), filename: 'starters image', content_type: 'image/jpg')
seven_dish.save!

eight_dish = Dish.new(name: "Pasta", todays_special: false, description: "very good", category: "Main Dishes", price: 13.00, restaurant: @second_restaurant)
eight_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613903061/main_gognsl.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
eight_dish.save!

nine_dish = Dish.new(name: "Pasta", todays_special: false, description: "very good", category: "Main Dishes", price: 14.00, restaurant: @second_restaurant)
nine_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613903061/main_gognsl.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
nine_dish.save!

ten_dish = Dish.new(name: "Pasta", todays_special: false, description: "very good", category: "Main Dishes", price: 15.00, restaurant: @second_restaurant)
ten_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613903061/main_gognsl.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
ten_dish.save!

eleven_dish = Dish.new(name: "Black Coffee", todays_special: false, description: "very aromatic", category: "Hot Beverages", price: 2.50, restaurant: @third_restaurant)
eleven_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
eleven_dish.save!

twelve_dish = Dish.new(name: "Milk Coffee", todays_special: false, description: "very aromatic", category: "Hot Beverages", price: 3.00, restaurant: @third_restaurant)
twelve_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
twelve_dish.save!

thirteen_dish = Dish.new(name: "Espresso", todays_special: false, description: "very aromatic", category: "Hot Beverages", price: 2.50, restaurant: @third_restaurant)
thirteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
thirteen_dish.save!

fourteen_dish = Dish.new(name: "Latte Macchiato", todays_special: false, description: "very aromatic", category: "Hot Beverages", price: 3.50, restaurant: @third_restaurant)
fourteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
fourteen_dish.save!

fifteen_dish = Dish.new(name: "Cappuccino", todays_special: false, description: "very aromatic", category: "Hot Beverages", price: 3.50, restaurant: @third_restaurant)
fifteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232517/capuccino_knecpy.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
fifteen_dish.save!

sixteen_dish = Dish.new(name: "Picanha", todays_special: true, description: "beef", category: "Meat", price: 10.00, restaurant: @fourth_restaurant)
sixteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg'), filename: 'meat image', content_type: 'image/jpg')
sixteen_dish.save!

seventeen_dish = Dish.new(name: "Coxo de frango", todays_special: false, description: "chicken", category: "Meat", price: 8.00, restaurant: @fourth_restaurant)
seventeen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg'), filename: 'meat image', content_type: 'image/jpg')
seventeen_dish.save!

eighteen_dish = Dish.new(name: "Lombo de porco", todays_special: false, description: "pork", category: "Meat", price: 8.00, restaurant: @fourth_restaurant)
eighteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg'), filename: 'meat image', content_type: 'image/jpg')
eighteen_dish.save!

nineteen_dish = Dish.new(name: "Cameiro", todays_special: false, description: "lamb", category: "Meat", price: 10.00, restaurant: @fourth_restaurant)
nineteen_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1613232732/meat_uhujya.jpg'), filename: 'meat image', content_type: 'image/jpg')
nineteen_dish.save!

twenty_dish = Dish.new(name: "Pudim", todays_special: true, description: "homemade pudding", category: "Desserts", price: 4.50, restaurant: @fourth_restaurant)
twenty_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162811/separeat/dessert_2.jpg'), filename: 'desserts image', content_type: 'image/jpg')
twenty_dish.save!

twentyone_dish = Dish.new(name: "Classic Burger", todays_special: false, description: "beef & cheddar cheese", category: "Main Dishes", price: 8.00, restaurant: @fifth_restaurant)
twentyone_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161319/separeat/burger_1.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentyone_dish.save!

twentytwo_dish = Dish.new(name: "Chicken Burger", todays_special: false, description: "chicken & cheddar cheese", category: "Main Dishes", price: 8.50, restaurant: @fifth_restaurant)
twentytwo_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614163838/separeat/chicken-burger.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentytwo_dish.save!

twentythree_dish = Dish.new(name: "Bacon Burger", todays_special: false, description: "beef, cheddar & bacon", category: "Main Dishes", price: 9.50, restaurant: @fifth_restaurant)
twentythree_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161258/separeat/bacon-burger.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentythree_dish.save!

twentyfour_dish = Dish.new(name: "Avocado Burger", todays_special: false, description: "beef, cheddar & avocado", category: "Main Dishes", price: 9.50, restaurant: @fifth_restaurant)
twentyfour_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162374/separeat/burger_2.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentyfour_dish.save!

twentyfive_dish = Dish.new(name: "Veggie Burger", todays_special: false, description: "grilled eggplant & cheddar", category: "Main Dishes", price: 9.00, restaurant: @fifth_restaurant)
twentyfive_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161205/separeat/veggie-burger.jpg'), filename: 'burgers image', content_type: 'image/jpg')
twentyfive_dish.save!

twentysix_dish = Dish.new(name: 'Salade Niçoise', todays_special: false, description: "tomatoes, egg, olives & tuna", category: "Starters", price: 6.50, restaurant: @fifth_restaurant)
twentysix_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615458332/separeat/Salad-nicoise.jpg'), filename: 'starters image', content_type: 'image/jpg')
twentysix_dish.save!

twentyseven_dish = Dish.new(name: 'Ceasar Salad', todays_special: false, description: "tomatoes, egg & cheese", category: "Starters", price: 6.50, restaurant: @fifth_restaurant)
twentyseven_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614160924/separeat/ceasar-salad.jpg'), filename: 'starters image', content_type: 'image/jpg')
twentyseven_dish.save!

twentyeight_dish = Dish.new(name: 'Tomato Soup', todays_special: false, description: "red, creamy & delish", category: "Starters", price: 5.50, restaurant: @fifth_restaurant)
twentyeight_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615458405/separeat/tomato_soup_xg8glt.jpg'), filename: 'starters image', content_type: 'image/jpg')
twentyeight_dish.save!

twentynine_dish = Dish.new(name: 'Toni\'s Pizza', todays_special: false, description: "fresh from the oven", category: "Main Dishes", price: 9.50, restaurant: @fifth_restaurant)
twentynine_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161333/separeat/pizza.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
twentynine_dish.save!

thirty_dish = Dish.new(name: 'Mac\'n\'Cheese', todays_special: false, description: "macaroni & lots of cheese", category: "Main Dishes", price: 10.00, restaurant: @fifth_restaurant)
thirty_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161541/separeat/macncheese.jpg'), filename: 'main dishes image', content_type: 'image/jpg')
thirty_dish.save!

thirtyone_dish = Dish.new(name: 'Ice Cream', todays_special: false, description: "vanilla, with caramel sauce", category: "Desserts", price: 4.50, restaurant: @fifth_restaurant)
thirtyone_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615461150/separeat/vanilla-ice-cream.jpg'), filename: 'desserts image', content_type: 'image/jpg')
thirtyone_dish.save!

thirtytwo_dish = Dish.new(name: 'Vanilla Pudding', todays_special: false, description: "with raspberry topping", category: "Desserts", price: 5.00, restaurant: @fifth_restaurant)
thirtytwo_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162811/separeat/dessert_2.jpg'), filename: 'desserts image', content_type: 'image/jpg')
thirtytwo_dish.save!

thirtythree_dish = Dish.new(name: 'Brownies', todays_special: false, description: "so chocolaty! enough for all", category: "Desserts", price: 35.00, restaurant: @fifth_restaurant)
thirtythree_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615458369/separeat/brownies_wdksnx.jpg'), filename: 'desserts image', content_type: 'image/jpg')
thirtythree_dish.save!

thirtyfour_dish = Dish.new(name: "Wheat", todays_special: false, description: "0.5 l", category: "Beers", price: 4.50, restaurant: @fifth_restaurant)
thirtyfour_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162249/separeat/beer_1.jpg'), filename: 'beers image', content_type: 'image/jpg')
thirtyfour_dish.save!

thirtyfive_dish = Dish.new(name: "Pilsner", todays_special: false, description: "0.3 l", category: "Beers", price: 3.50, restaurant: @fifth_restaurant)
thirtyfive_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161422/separeat/beer_2.jpg'), filename: 'beers image', content_type: 'image/jpg')
thirtyfive_dish.save!

thirtysix_dish = Dish.new(name: "Espresso", todays_special: false, description: "very strong", category: "Hot Beverages", price: 2.50, restaurant: @fifth_restaurant)
thirtysix_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614162704/separeat/coffee_1.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
thirtysix_dish.save!

thirtyseven_dish = Dish.new(name: "Cappuccino", todays_special: false, description: "very aromatic", category: "Hot Beverages", price: 3.50, restaurant: @fifth_restaurant)
thirtyseven_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614163137/separeat/coffee_2.jpg'), filename: 'hot_bevs image', content_type: 'image/jpg')
thirtyseven_dish.save!

thirtyeight_dish = Dish.new(name: 'Platter No.1', todays_special: false, description: '15 mouth-watering burgers', category: "Meat", price: 75.00, restaurant: @fifth_restaurant)
thirtyeight_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615457296/separeat/burger-platter-4_clfgb7.jpg'), filename: 'burgers image', content_type: 'image/jpg')
thirtyeight_dish.save!

thirtynine_dish = Dish.new(name: 'Sparkling Water', todays_special: false, description: '0.4 l', category: "Beverages", price: 2.50, restaurant: @fifth_restaurant)
thirtynine_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161122/separeat/mineral-water.jpg'), filename: 'bevs image', content_type: 'image/jpg')
thirtynine_dish.save!

fourty_dish = Dish.new(name: 'Lemonade', todays_special: false, description: '0.4 l', category: "Beverages", price: 3.50, restaurant: @fifth_restaurant)
fourty_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614163235/separeat/lemonade.jpg'), filename: 'bevs image', content_type: 'image/jpg')
fourty_dish.save!

fourtyone_dish = Dish.new(name: 'Platter No.2', todays_special: false, description: '15 sensationally big burgers', category: "Meat", price: 85.00, restaurant: @fifth_restaurant)
fourtyone_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615457603/separeat/burger-platter-6_skfrnl.jpg'), filename: 'bevs image', content_type: 'image/jpg')
fourtyone_dish.save!

fourtytwo_dish = Dish.new(name: 'Coke', todays_special: false, description: '0.4 l', category: "Beverages", price: 3.50, restaurant: @fifth_restaurant)
fourtytwo_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1614161053/separeat/coke.jpg'), filename: 'bevs image', content_type: 'image/jpg')
fourtytwo_dish.save!

fourtythree_dish = Dish.new(name: 'Veggie Platter', todays_special: false, description: '15 delish veggie burgers', category: "Vegetarian", price: 70.00, restaurant: @fifth_restaurant)
fourtythree_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615457734/separeat/veggie-burger-platter.jpg'), filename: 'bevs image', content_type: 'image/jpg')
fourtythree_dish.save!

fourtyfour_dish = Dish.new(name: 'Vegan Platter', todays_special: false, description: '15 extra tasty vegan burgers', category: "Vegan", price: 75.00, restaurant: @fifth_restaurant)
fourtyfour_dish.photo.attach(io: URI.open('https://res.cloudinary.com/dinjscr9h/image/upload/v1615457638/separeat/burger-platter-3_nt0x6f.jpg'), filename: 'bevs image', content_type: 'image/jpg')
fourtyfour_dish.save!
puts "#{Dish.count}/44 dishes were created."

# 5. VISITS

puts "Creating visits..."
visit_one = Visit.create!(start_date: "2021-03-10 18:00:00 CET", end_date: "2021-02-22 21:00:00 CET", guests: 5, user: @third_user, table: @table_fifteen )
visit_two = Visit.create!(start_date: "2021-03-05 16:00:00 CET", end_date: "2021-01-22 17:30:00 CET", guests: 2, user: @third_user, table: @table_nine )
visit_three = Visit.create!(start_date: "2021-03-06 19:00:00 CET", end_date: "2021-03-02 21:00:00 CET", guests: 5, user: @third_user, table: @table_one )
visit_four = Visit.create!(start_date: "2021-03-07 18:15:00 CET", end_date: "2021-01-06 20:30:00 CET", guests: 4, user: @third_user, table: @table_four)
puts "#{Visit.count}/4 visits were created."

# 6. REVIEWS

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
