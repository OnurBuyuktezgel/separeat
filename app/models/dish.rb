class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders

  CATEGORIES = ['Starter', 'Main Dish', 'Dessert', 'Soup', 'Salad', 'Fish', 'Meat', 'Pasta', 'Vegetarian', 'Vegan', 'Beverage', 'Hot Beverage', 'Alcoholic Beverage']
  validates :name, presence: true, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  # validates :description, presence: true
end

