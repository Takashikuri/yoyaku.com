class Reservation < ApplicationRecord
  
 
  
  validates :reserve_day, presence: true
  validates :reserve_name, presence: { message: '予約名を入力してください' }
  validates :reserve_phone_number, presence: { message: '電話番号を入力してください' }, length: {minimum: 10 }
  validates :member, presence: {message: '予約人数を入力してください' }
  validates :course, presence: true
  validates :medium, presence: true
  
end
