module CoachManager
  class ActiveClientsCount < ApplicationService
    def initialize(coach)
      @coach = coach
    end
  
    def call()
      active_clients_count
    end
  
    private
  
    def active_clients_count
      @coach.invitations.where(status: 1).count
    end
  end
end
