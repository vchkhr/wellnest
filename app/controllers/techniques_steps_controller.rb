class TechniquesStepsController < InheritedResources::Base

  private

    def techniques_step_params
      params.require(:techniques_step).permit(:technique_id, :step_id)
    end

end
