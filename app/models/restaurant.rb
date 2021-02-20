class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :tables
  has_many :dishes
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORIES = ['Asian', 'Bar', 'Brazilian', 'Burgers', 'Café', 'Chinese', 'Fish', 'Greek', 'Indian', 'Italian', 'Japanese', 'Moroccan', 'Mexican', 'Pasta', 'Polish', 'Spanish', 'Sushi', 'Thai', 'Turkish', 'Vegan', 'Vegetarian', 'Vietnamese']

  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
