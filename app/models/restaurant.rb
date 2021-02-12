class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :tables
  has_many :dishes

  CATEGORIES = ['Asian', 'Burgers', 'Café', 'Chinese', 'Fish', 'Greek', 'Indian', 'Italian', 'Japanese', 'Moroccan', 'Mexican', 'Pasta', 'Spanish', 'Sushi', 'Thai', 'Turkish', 'Vegan', 'Vegetarian', 'Vietnamese']
end
