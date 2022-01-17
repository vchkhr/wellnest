module ClientManager
  class HoursCompleted < ApplicationService
    def initialize(client)
      @client = client
    end
  
    def call()
      hours_completed
    end
  
    private
  
    def hours_completed
      count = 0
      Technique.where_client(@client).each { |technique| count += (technique.duration_start + technique.duration_end) / 2.0 if ClientManager::CompletedStepsCount.call(technique) == technique.steps.count }
      count.round(1)
    end
  end
end
