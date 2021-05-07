class User < ApplicationRecord
  has_secure_password
  validates :store_name, presence: true, length: {maximum: 30}, uniqueness: true
  validates :phone_number, presence: true, length: { minimum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 }
end
