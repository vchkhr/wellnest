class Client < ApplicationRecord
  self.primary_key = "id"

  validate :photo_url
  validates :age, numericality: { only_integer: true, in: 18..99 }
  validate :bio
  
  belongs_to :user
  belongs_to :gender
  
  has_and_belongs_to_many :problems
  has_and_belongs_to_many :coaches
  has_and_belongs_to_many :techniques
  has_and_belongs_to_many :steps
end
