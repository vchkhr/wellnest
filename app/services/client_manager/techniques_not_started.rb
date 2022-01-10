module ClientManager
    class TechniquesNotStarted < ApplicationService
      def initialize(client)
        @client = client
      end
    
      def call()
        techniques_not_started
      end
    
      private
    
      def techniques_not_started
        techniques = []
        TechniqueManager::ClientTechniques.call(@client).each do |technique|
            techniques << technique if ClientManager::CompletedStepsCount.call(technique) == 0
        end
        techniques
      end
    end
  end
  