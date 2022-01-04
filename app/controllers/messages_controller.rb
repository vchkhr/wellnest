class MessagesController < InheritedResources::Base

  private

    def message_params
      params.require(:message).permit(:text, :from_client, :client_id, :coach_id)
    end

end
