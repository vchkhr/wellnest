class Client < ApplicationRecord
  self.primary_key = "id"

  validates :user_id, presence: true
  validates :age, presence: true, numericality: { only_integer: true, in: 18..99 }
  validates :gender, presence: true
  validates :problems, presence: true

  has_one_attached :image
  
  belongs_to :user

  belongs_to :gender
  
  has_many :invitations
  has_many :coaches, through: :invitations

  has_many :notifications
  
  has_many :messages
  has_many :coaches, through: :messages

  has_many :completed_steps
  has_many :steps, through: :completed_steps

  has_many :likes
  has_many :techniques, through: :likes

  has_and_belongs_to_many :problems
  has_and_belongs_to_many :techniques
end
