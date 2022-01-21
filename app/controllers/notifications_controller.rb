class NotificationsController < InheritedResources::Base

  private

    def notification_params
      params.require(:notification).permit(:text, :client_id)
    end

end
