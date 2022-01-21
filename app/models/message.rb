class Message < ApplicationRecord
  validates :text, presence: true
  validates :from_client, inclusion: [true, false]
  
  belongs_to :client
  belongs_to :coach
end
