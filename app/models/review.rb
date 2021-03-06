class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

validates :content, presence: true, length: { minimum: 5, message: "only allows letters"}
validates :rating, inclusion: { in: 0..5 }

end
