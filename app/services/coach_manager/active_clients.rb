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
      @coach.invitations.where(status: 1).count
    end
  end
end
