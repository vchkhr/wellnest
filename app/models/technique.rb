class Technique < ApplicationRecord
  self.primary_key = "id"

  validates :title, presence: true
  validates :description, presence: true

  validates :age_start, numericality: { only_integer: true, in: 18..99 }
  validates :age_end, numericality: { only_integer: true, in: 18..99 }

  validates :duration_start, numericality: { only_integer: true, in: 18..99 }
  validates :duration_end, numericality: { only_integer: true, in: 18..99 }

  has_many :users_technique, dependent: :delete_all
  has_many :users, through: :users_technique

  has_many :likes, dependent: :delete_all
  has_many :users, through: :likes

  has_and_belongs_to_many :problems
  has_and_belongs_to_many :genders
  has_and_belongs_to_many :steps
end
