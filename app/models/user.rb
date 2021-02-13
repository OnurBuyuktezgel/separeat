class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants

  USER_TYPES = ['Restaurant_owner', 'Customer']
  validates :user_type, presence: true, inclusion: { in: USER_TYPES, allow_nil: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true

end

