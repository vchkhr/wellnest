module TechniqueManager
  class ClientTechniques < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      client_techniques
    end
  
    private
  
    def client_techniques
      @client.techniques.uniq
    end
  end
end
