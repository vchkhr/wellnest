class Invitation < ApplicationRecord
    self.primary_key = "id"

    validates :status, numericality: { only_integer: true, in: -1..1 }

    belongs_to :client
    belongs_to :coach
end
