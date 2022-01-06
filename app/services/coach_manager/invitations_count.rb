module CoachManager
  class InvitationsCount < ApplicationService
    def initialize(coach)
      @coach = coach
    end
  
    def call()
      invitations_count
    end
  
    private
  
    def invitations_count
      @coach.invitations.where(status: 0).count
    end
  end
end
