class User < ApplicationRecord
  has_secure_password
  
  
  validates :store_name, length: {maximum: 30}, uniqueness: true, presence: { message: 'この%{attribute}は1文字以上入力してください。'}
  validates :phone_number, presence: true, length: { minimum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
end
