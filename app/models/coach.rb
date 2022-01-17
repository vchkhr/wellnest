class Coach < ApplicationRecord
  self.primary_key = "id"

  validates :age, numericality: { only_integer: true, in: 18..99 }
  validates :education, presence: true
  validates :work, presence: true
  validates :licenses, presence: true
  validates :links, presence: true
  validates :problems, presence: true
  as_enum :gender, female: 1, male: 0
  
  has_one_attached :image

  has_many :invitations, dependent: :delete_all
  has_many :clients, through: :invitations
  
  has_many :messages, dependent: :delete_all
  has_many :clients, through: :messages

  has_many :coach_notifications, dependent: :delete_all

  belongs_to :user

  has_and_belongs_to_many :problems
end
