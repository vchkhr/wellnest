class CompletedStepsController < InheritedResources::Base
  def new
    technique_id = params[:technique_id]
    technique = Technique.find(technique_id)

    CompletedStep.create!(client: current_user.client, step: Step.find(params[:step_id]))

    time_change = (technique.duration_end + technique.duration_start) / 2.0 / technique.steps.count
    current_user.client.increment!(:total_time, time_change)
    current_user.client.increment!(:current_time, time_change)

    if params[:last_step] == "true"
      current_user.client.update!(current_time: 0)

      Notification.create!(client: current_user.client, text: "You have finished technique: #{technique.title}")
      redirect_to new_like_path(technique_id: technique_id)
    else
      redirect_to technique_path(technique)
    end
  end

  def edit
    technique_id = params[:technique_id]
    technique = Technique.find(technique_id)

    if params[:delete] == 'true'
      CompletedStep.where(client: current_user.client, step: Step.find(params[:step_id])).destroy_all

      time_change = (technique.duration_end + technique.duration_start) / 2.0 / technique.steps.count * (-1)
      current_user.client.increment!(:total_time, time_change)
      current_user.client.increment!(:current_time, time_change)
      current_user.client.current_time = 0 if current_user.client.current_time < 0
    end

    redirect_to technique_path(Technique.find(params[:technique_id]))
  end

  private

    def completed_step_params
      params.require(:completed_step).permit(:client_id, :step_id)
    end
end
