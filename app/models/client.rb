class Client < ApplicationRecord
  self.primary_key = "id"

  validate :photo_url
  validates :age, presence: true
  validate :bio
  # validate :user_id
  
  belongs_to :user
  belongs_to :gender
  # has_and_belongs_to_many :problem
  # has_many :coaches, through: :invitations
end
