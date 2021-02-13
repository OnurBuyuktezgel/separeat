class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_many :orders
end

