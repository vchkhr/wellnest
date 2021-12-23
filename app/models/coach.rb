class Coach < ApplicationRecord
  self.primary_key = "id"

  validate :photo_url
  validates :age, presence: true
  validates :gender_id, presence: true
  validates :edu, presence: true
  validates :work, presence: true
  validates :licenses, presence: true
  validates :links, presence: true
  validate :is_verified

  belongs_to :user
  belongs_to :gender
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :problems
end
