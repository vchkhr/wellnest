class ClientsProblemsController < InheritedResources::Base

  private

    def clients_problem_params
      params.require(:clients_problem).permit(:client_id, :problem_id)
    end

end
