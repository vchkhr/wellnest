class ClientsTechniquesController < InheritedResources::Base

  private

    def clients_technique_params
      params.require(:clients_technique).permit(:client_id, :technique_id)
    end

end
