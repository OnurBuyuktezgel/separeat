class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders
  has_one_attached :photo

  CATEGORIES = ['Starters', 'Main Dishes', 'Desserts', 'Soups', 'Salads', 'Fish', 'Meat', 'Pasta', 'Vegetarian', 'Vegan', 'Beverages', 'Hot Beverages', 'Alcoholic Beverages']

  validates :name, presence: true, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  # validates :description, presence: true
end
