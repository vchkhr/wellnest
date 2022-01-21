module CoachManager
  class TechniquesLiked < ApplicationService
    def initialize(coach)
      @coach = coach
    end
  
    def call()
      techniques_liked
    end
  
    private
  
    def techniques_liked
      count = 0
      @coach.invitations.where(status: 1).each do |invitation|
        invitation.client.techniques.each do |technique|
          count += technique.likes.where(is_like: true).count
        end
      end
      count
    end
  end
end
