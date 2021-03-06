module ClientManager
  class TechniquesCompleted < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      techniques_completed
    end
  
    private
  
    def techniques_completed
      techniques = []
      Technique.where_client(@client).each do |technique|
          techniques << technique if ClientManager::CompletedStepsInTechnique.call(@client, technique) == technique.steps.count
      end
      techniques
    end
  end
end
