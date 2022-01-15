class Problem < ApplicationRecord
  self.primary_key = "id"

  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :users
  has_and_belongs_to_many :coaches
  has_and_belongs_to_many :techniques
end
