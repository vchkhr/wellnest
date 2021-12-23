class Client < ApplicationRecord
  self.primary_key = "id"

  validate :photo_url
  validates :age, presence: true
  validate :bio
  
  belongs_to :user
  belongs_to :gender
  has_and_belongs_to_many :problems
  has_and_belongs_to_many :coaches
end
