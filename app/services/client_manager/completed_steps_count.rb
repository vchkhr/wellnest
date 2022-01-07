module ClientManager
  class CompletedStepsCount < ApplicationService
    def initialize(technique)
      @technique = technique
    end
  
    def call()
      completed_steps_count
    end
  
    private
  
    def completed_steps_count
      count = 0
      @technique.steps.each { |step| count += 1 unless CompletedStep.find_by_step_id(step.id).nil? }
      count
    end
  end
end
