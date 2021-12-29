class Message < ApplicationRecord
  self.primary_key = "id"

  validates :text, presence: true
  validate :from_client

  belongs_to :client
  belongs_to :coach
end
