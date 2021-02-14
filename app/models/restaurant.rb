class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :tables
  has_many :dishes
  has_one_attached :photo

  CATEGORIES = ['Asian', 'Bar', 'Brazilian', 'Burgers', 'Café', 'Chinese', 'Fish', 'Greek', 'Indian', 'Italian', 'Japanese', 'Moroccan', 'Mexican', 'Pasta', 'Polish', 'Spanish', 'Sushi', 'Thai', 'Turkish', 'Vegan', 'Vegetarian', 'Vietnamese']

  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
                  associated_against: {
                    dish: [:name, :category]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
