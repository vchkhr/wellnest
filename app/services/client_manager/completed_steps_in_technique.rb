module ClientManager
  class CompletedStepsInTechnique < ApplicationService
    def initialize(client, technique)
      @client = client
      @technique = technique
    end
  
    def call()
      completed_steps_count
    end
  
    private
  
    def completed_steps_count
      count = 0
      @technique.steps.each { |step| count += 1 unless CompletedStep.where(client: @client, step: step).empty? }
      count
    end
  end
end
