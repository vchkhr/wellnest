module ClientManager
  class TechniquesInProgress < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      techniques_in_progress
    end
  
    private
  
    def techniques_in_progress
      techniques = []
      @client.techniques.each do |technique|
          techniques << technique if ClientManager::CompletedStepsCount.call(technique) > 0 and ClientManager::CompletedStepsCount.call(technique) != technique.steps.count
      end
      techniques
    end
  end
end
