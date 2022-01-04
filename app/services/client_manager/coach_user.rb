module ClientManager
  class CoachUser < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      coach_user
    end
  
    private
  
    def coach_user
      ClientManager::Coach.call(@client).user unless ClientManager::Coach.call(@client).nil?
    end
  end
end
