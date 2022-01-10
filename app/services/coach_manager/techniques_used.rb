module CoachManager
  class TechniquesUsed < ApplicationService
    def initialize(coach)
      @coach = coach
    end
  
    def call()
      techniques_used
    end
  
    private
  
    def techniques_used
      count = 0
      @coach.invitations.where(status: 1).each { |invitation| count += invitation.client.techniques.uniq.count }
      count
    end
  end
end
