class Technique < ApplicationRecord
  self.primary_key = "id"

  validates :title, presence: true
  validates :description, presence: true

  validates :age_start, numericality: { only_integer: true, in: 18..99 }
  validates :age_end, numericality: { only_integer: true, in: 18..99 }

  validates :duration_start, numericality: { only_integer: true, in: 18..99 }
  validates :duration_end, numericality: { only_integer: true, in: 18..99 }

  validates :likes, numericality: { only_integer: true, minimum: 0 }
  validates :dislikes, numericality: { only_integer: true, minimum: 0 }

  has_many :clients_technique
  has_many :clients, through: :clients_technique

  has_and_belongs_to_many :problems
  has_and_belongs_to_many :genders
  has_and_belongs_to_many :steps
end
