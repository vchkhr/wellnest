class Invitation < ApplicationRecord
  validates :status, numericality: { only_integer: true, in: 0..1 }

  belongs_to :client
  belongs_to :coach
end