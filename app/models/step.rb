class Step < ApplicationRecord
  self.primary_key = "id"

  validates :title, presence: true
  validates :description, presence: true

  validate :image
  validate :video_url
  validate :audio_url

  has_many :completed_steps
  has_many :clients, through: :completed_steps

  has_and_belongs_to_many :techniques
end
