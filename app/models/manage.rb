class Manage < ApplicationRecord
  # belongs_to :user
  
  validates :start_time, presence: true
  validates :last_time, presence: true
  validates :finish_time, presence: true
  
  
  scope :start_time, -> { order(start_time: :asc) }
  ransacker :created_at, callable: proc { Arel.sql('DATE(created_at)') }
end
