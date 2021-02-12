class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders

  CATEGORIES = ['Starter', 'Main Dish', 'Dessert', 'Soup', 'Salad', 'Fish', 'Meat', 'Pasta', 'Vegetarian', 'Vegan', 'Beverage', 'Hot Beverage', 'Alcoholic Beverage']
end
