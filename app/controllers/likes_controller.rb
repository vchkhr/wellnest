class LikesController < InheritedResources::Base
  def new
    if params.key?('is_like')
      technique = Technique.find(params['technique_id'])

      Like.where(client: current_user.client, technique: technique).each { |technique| technique.destroy }
      
      @like = Like.new(is_like: params['is_like'], client: current_user.client, technique: technique)
      
      respond_to do |format|
        if @like.save
          action = params['is_like'] == 'true' ? "liked" : "disliked"

          format.html { redirect_to dashboard_path, notice: "You #{action} the technique." }
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
