class Coach < ApplicationRecord
  self.primary_key = "id"

  has_one_attached :image
  validates :age, numericality: { only_integer: true, in: 18..99 }
  validates :gender_id, presence: true
  validates :edu, presence: true
  validates :work, presence: true
  validates :licenses, presence: true
  validates :links, presence: true
  
  has_many :invitations
  has_many :clients, through: :invitations
  
  has_many :messages
  has_many :clients, through: :messages

  belongs_to :user
  belongs_to :gender
  has_and_belongs_to_many :problems
end
