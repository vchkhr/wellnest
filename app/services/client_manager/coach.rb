module ClientManager
  class Coach < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      coach
    end
  
    private
  
    def coach
      @client.invitations.where(status: 1).last.coach unless @client.invitations.where(status: 1).last.nil?
    end
  end
end
