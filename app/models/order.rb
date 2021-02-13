class Order < ApplicationRecord
  belongs_to :dish
  belongs_to :visit

enum status: { submitted: 0, in_progress: 1, delivered: 2 }

end
