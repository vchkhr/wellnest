class Client < ApplicationRecord
  self.primary_key = "id"

  validate :image_url
  validates :age, numericality: { only_integer: true, in: 18..99 }
  validate :bio
  
  belongs_to :user
  belongs_to :gender
  
  has_many :invitations
  has_many :coaches, through: :invitations

  has_many :notifications
  
  has_many :messages
  has_many :coaches, through: :messages

  has_and_belongs_to_many :problems
  has_and_belongs_to_many :techniques
  has_and_belongs_to_many :steps

  def invitation
    return self.invitations.where(status: 1).last
  end
end
