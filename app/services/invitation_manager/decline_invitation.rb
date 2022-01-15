module InvitationManager
  class DeclineInvitation < ApplicationService
    def initialize(user, coach)
      @user = user
      @coach = coach
    end
  
    def call()
      decline_invitation
    end
  
    private
  
    def decline_invitation
      Invitation.where(user: @user, coach: @coach).destroy_all
    end
  end
end
