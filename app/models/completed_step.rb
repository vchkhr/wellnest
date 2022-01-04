class CompletedStep < ApplicationRecord
  belongs_to :client
  belongs_to :step
end
