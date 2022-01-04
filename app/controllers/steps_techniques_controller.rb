class StepsTechniquesController < InheritedResources::Base

  private

    def steps_technique_params
      params.require(:steps_technique).permit(:step_id, :technique_id)
    end

end
