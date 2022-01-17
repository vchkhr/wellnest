module ClientManager
  class HoursInProgress < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      hours_in_progress
    end
  
    private
  
    def hours_in_progress
      count = 0
      Technique.where_client(@client).each { |technique| count += (technique.duration_start + technique.duration_end) / 2.0 / technique.steps.count * ClientManager::CompletedStepsInTechnique.call(technique) if ClientManager::CompletedStepsInTechnique.call(technique) > 0 and ClientManager::CompletedStepsInTechnique.call(technique) < technique.steps.count }
      count.round(1)
    end
  end
end
