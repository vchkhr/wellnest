module ClientManager
  class TechniquesInProgressCount < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      techniques_in_progress_count
    end
  
    private
  
    def techniques_in_progress_count
      count = 0
      Technique.where_client(@client).each { |technique| count += 1 if ClientManager::CompletedStepsInTechnique.call(technique) > 0 and ClientManager::CompletedStepsInTechnique.call(technique) < technique.steps.count }
      count
    end
  end
end
