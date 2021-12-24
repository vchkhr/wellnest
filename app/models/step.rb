class Step < ApplicationRecord
    self.primary_key = "id"
  
    validates :title, presence: true
    validates :description, presence: true
  
    validate photo_url
    validate video_url
    validate audio_url

    has_and_belongs_to_many :techniques
    has_and_belongs_to_many :clients
end
