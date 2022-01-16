module InvitationManager
  class AcceptInvitation < ApplicationService
    def initialize(user, coach)
      @user = user
      @coach = coach
    end
  
    def call()
      accept_invitation
    end
  
    private
  
    def accept_invitation
      InvitationManager::DeclineInvitation.call(@user, @coach)
      Invitation.create!(user: @user, coach: @coach, status: 1)
    end
  end
end
