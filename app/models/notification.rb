class Notification < ApplicationRecord
  self.primary_key = "id"

  validates :text, presence: true

  has_many :client
end
