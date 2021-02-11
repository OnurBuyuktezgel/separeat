class Order < ApplicationRecord
  belongs_to :dish
  belongs_to :visit
end
