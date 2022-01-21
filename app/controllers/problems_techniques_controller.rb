class ProblemsTechniquesController < InheritedResources::Base

  private

    def problems_technique_params
      params.require(:problems_technique).permit(:problem_id, :technique_id)
    end

end
