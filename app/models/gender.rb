class Gender < ApplicationRecord
  self.primary_key = "id"

  validates :name, presence: true, uniqueness: true

  has_many :clients
  has_many :coaches
  
  has_and_belongs_to_many :techniques
end
