class CompletedStep < ApplicationRecord
  belongs_to :user
  belongs_to :step
end
