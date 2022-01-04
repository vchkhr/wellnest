class CoachesProblemsController < InheritedResources::Base

  private

    def coaches_problem_params
      params.require(:coaches_problem).permit(:coach_id, :problem_id)
    end

end
