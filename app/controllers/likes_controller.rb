class LikesController < InheritedResources::Base
  def new
    if params.key?('is_like')
      technique = Technique.find(params['technique_id'])

      Like.where(client: current_user.client, technique: technique).destroy_all
      
      @like = Like.new(is_like: params['is_like'], client: current_user.client, technique: technique)

      if params['is_like'] == 'true'
        Coach.for_client(current_user.client).first.increment!(:likes_count, 1)
      end
      
      respond_to do |format|
        if @like.save
          action = params['is_like'] == 'true' ? "liked" : "disliked"

          text = "You #{action} the technique: #{technique.title}"
          Notification.create!(client: current_user.client, text: text)

          format.html { redirect_to dashboard_path, notice: text }
          format.json { render :show, status: :created, location: @like }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @like.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:is_like, :technique_id, :client_id)
  end
end
