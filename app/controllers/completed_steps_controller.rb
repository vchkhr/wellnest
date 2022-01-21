class CompletedStepsController < InheritedResources::Base
  def new
    technique_id = params[:technique_id]

    CompletedStep.create!(client: current_user.client, step: Step.find(params[:step_id]))

    if params[:last_step] == "true"
      redirect_to new_like_path(technique_id: technique_id)
    else
      redirect_to technique_path(Technique.find(technique_id))
    end
  end

  def edit
    if params[:delete] == 'true'
      CompletedStep.where(client: current_user.client, step: Step.find(params[:step_id])).each { |step| step.destroy }
    end

    redirect_to technique_path(Technique.find(params[:technique_id]))
  end

  private

  def completed_step_params
    params.require(:completed_step).permit(:client_id, :step_id)
  end
end
