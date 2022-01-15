class Message < ApplicationRecord
  validates :text, presence: true
  validates :from_user, inclusion: [true, false]
  
  belongs_to :user
  belongs_to :coach
end
