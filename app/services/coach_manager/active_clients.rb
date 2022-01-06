module CoachManager
  class ActiveClients < ApplicationService
    def initialize(coach)
      @coach = coach
    end
  
    def call()
      active_clients
    end
  
    private
  
    def active_clients
      clients = []
      @coach.invitations.where(status: 1).each { |invitation| clients << invitation.client }
      clients
    end
  end
end
