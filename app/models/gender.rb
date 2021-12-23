class Gender < ApplicationRecord
  self.primary_key = "id"

  validates :name, presence: true, uniqueness: true

  has_many :clients
  has_many :coaches
end
