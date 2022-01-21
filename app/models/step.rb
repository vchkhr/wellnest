class Step < ApplicationRecord
  self.primary_key = "id"

  validates :title, presence: true
  validates :description, presence: true

  has_many :completed_steps, dependent: :delete_all
  has_many :clients, through: :completed_steps

  has_and_belongs_to_many :techniques
end
