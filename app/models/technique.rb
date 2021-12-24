class Technique < ApplicationRecord
  self.primary_key = "id"

  validates :title, presence: true
  validates :description, presence: true

  validates :age_start, presence: true
  validates :age_end, presence: true

  validates :duration_start, presence: true
  validates :duration_end, presence: true

  validate :likes
  validate :dislikes

  has_and_belongs_to_many :problems
  has_and_belongs_to_many :genders
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :steps
end
