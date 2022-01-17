class Technique < ApplicationRecord
  self.primary_key = "id"

  validates :title, presence: true
  validates :description, presence: true
  as_enum :gender, both: 2, female: 1, male: 0

  validates :age_start, numericality: { only_integer: true, in: 18..99 }
  validates :age_end, numericality: { only_integer: true, in: 18..99 }

  validates :duration_start, numericality: { only_integer: true, in: 18..99 }
  validates :duration_end, numericality: { only_integer: true, in: 18..99 }

  has_many :clients_technique, dependent: :delete_all
  has_many :clients, through: :clients_technique

  has_many :likes, dependent: :delete_all
  has_many :clients, through: :likes

  has_and_belongs_to_many :problems
  has_and_belongs_to_many :genders
  has_and_belongs_to_many :steps
end
