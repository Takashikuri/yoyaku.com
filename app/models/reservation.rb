class Reservation < ApplicationRecord
  # def set_date
  #   reserve_day.strftime("%Y-%m-%d %H:%M")
  # end
  
  validates :reserve_day, presence: true
  
end
