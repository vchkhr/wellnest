class Notification < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :client
end
