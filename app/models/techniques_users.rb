class TechniquesUsers < ApplicationRecord
  belongs_to :technique
  belongs_to :user
end
