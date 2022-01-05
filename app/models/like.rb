class Like < ApplicationRecord
  validates :is_like, inclusion: [true, false]
  
  belongs_to :technique
  belongs_to :client
end
