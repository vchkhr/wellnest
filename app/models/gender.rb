class Gender < ApplicationRecord
  self.primary_key = "id"

  validates :name, presence: true, uniqueness: true

  has_many :users, dependent: :delete_all
  has_many :coaches, dependent: :delete_all
  
  has_and_belongs_to_many :techniques
end
