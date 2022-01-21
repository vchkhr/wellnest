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
      Technique.where_client(@client).each do |technique|
          techniques << technique if ClientManager::CompletedStepsInTechnique.call(@client, technique) > 0 and ClientManager::CompletedStepsInTechnique.call(@client, technique) != technique.steps.count
      end
      techniques
    end
  end
end
