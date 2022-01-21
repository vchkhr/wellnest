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
      @client.techniques.each { |technique| count += 1 if ClientManager::CompletedStepsCount.call(technique) > 0 and ClientManager::CompletedStepsCount.call(technique) < technique.steps.count }
      count
    end
  end
end
