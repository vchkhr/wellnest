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
        @client.techniques.each do |technique|
            techniques << technique if ClientManager::CompletedStepsCount.call(technique) == technique.steps.count
        end
        techniques
      end
    end
  end
  