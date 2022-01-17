module ClientManager
  class TechniquesCompletedCount < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      techniques_completed_count
    end
  
    private
  
    def techniques_completed_count
      count = 0
      Technique.where_client(@client).each { |technique| count += 1 if ClientManager::CompletedStepsInTechnique.call(technique) == technique.steps.count }
      count
    end
  end
end
