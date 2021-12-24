class Notification < ApplicationRecord
    self.primary_key = "id"

    validates :description, null: false

    belongs_to :client
end
