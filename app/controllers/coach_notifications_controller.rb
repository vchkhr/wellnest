class CoachNotificationsController < InheritedResources::Base

  private

    def coach_notification_params
      params.require(:coach_notification).permit(:text, :coach_id)
    end

end
