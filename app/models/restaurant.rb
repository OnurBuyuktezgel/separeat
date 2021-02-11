class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :tables
  has_many :dishes
end
