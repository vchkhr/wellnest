class LikesController < InheritedResources::Base

  private

    def like_params
      params.require(:like).permit(:is_like, :technique_id, :client_id)
    end

end
