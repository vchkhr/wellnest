class CompletedStepsController < InheritedResources::Base

  private

    def completed_step_params
      params.require(:completed_step).permit(:client_id, :step_id)
    end

end
