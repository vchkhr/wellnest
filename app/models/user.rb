class User < ApplicationRecord
  self.primary_key = "id"

  validates :name, presence: true

  has_one :client
  has_one :coach
end
