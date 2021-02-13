class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :tables
  has_many :dishes


  CATEGORIES = ['Asian', 'Bar', 'Brazilian', 'Burgers', 'Café', 'Chinese', 'Fish', 'Greek', 'Indian', 'Italian', 'Japanese', 'Moroccan', 'Mexican', 'Pasta', 'Polish', 'Spanish', 'Sushi', 'Thai', 'Turkish', 'Vegan', 'Vegetarian', 'Vietnamese']
  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
