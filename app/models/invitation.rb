class Invitation < ApplicationRecord
  validates :status, numericality: { only_integer: true, in: 0..1 }

  belongs_to :client
  belongs_to :coach

  counter_culture :coach, column_name: proc {|model| model.status == 1 ? 'active_clients_count' : nil }

  counter_culture :coach, column_name: proc {|model| model.status == 0 ? 'invitations_count' : nil }
end
