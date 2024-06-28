class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :Item
  has_one :address
  
end
