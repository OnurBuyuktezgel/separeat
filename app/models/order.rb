class Order < ApplicationRecord
  belongs_to :dish
  belongs_to :visit

enum status: { pending: 0, confirmed: 1, declined: 2 }

end
