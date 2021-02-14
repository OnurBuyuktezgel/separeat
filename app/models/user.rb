class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants
  has_one_attached :photo

  USER_TYPES = ['Restaurant Owner', 'Customer']

  validates :user_type, presence: true, inclusion: { in: USER_TYPES, allow_nil: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
