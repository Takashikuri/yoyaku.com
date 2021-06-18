class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # include ActiveModel::Model
  # include ActiveModel::Attributes
  # include ActiveRecord::AttributeAssignment
  
  # attribute :created_at
  def checked?(data)
    ActiveRecord::Type::Boolean.new.cast(data)
  end
end
