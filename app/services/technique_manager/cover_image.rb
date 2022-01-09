module TechniqueManager
  class CoverImage < ApplicationService
    def initialize(technique)
      @technique = technique
    end
  
    def call()
      cover_image
    end
  
    private
  
    def cover_image
      unless @technique.image.nil?
        @technique.image
      else
        "behaviour-therapy.jpg"
      end
    end
  end
end
