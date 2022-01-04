module ClientManager
  class UnconfirmedInvitation < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      unconfirmed_invitation
    end
  
    private
  
    def unconfirmed_invitation
      @client.invitations.where(status: 0).last.coach unless @client.invitations.where(status: 0).last.nil?
    end
  end
end
