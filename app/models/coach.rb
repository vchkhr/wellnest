class Coach < ApplicationRecord
  self.primary_key = "id"

  validates :age, numericality: { only_integer: true, in: 18..99 }
  validates :education, presence: true
  validates :work, presence: true
  validates :licenses, presence: true
  validates :links, presence: true
  validates :problems, presence: true
  
  has_one_attached :image

  has_many :invitations
  has_many :clients, through: :invitations
  
  has_many :messages
  has_many :clients, through: :messages

  has_many :coach_notifications

  belongs_to :user
  belongs_to :gender

  has_and_belongs_to_many :problems
end
