class ClientsTechniquesController < InheritedResources::Base
  def new
    @clients_technique = ClientsTechnique.new
    @clients = CoachManager::ActiveClients.call(current_user.coach)
  end

  def create
    technique = Technique.find(params[:clients_technique][:technique_id])

    params[:clients_technique][:client_id].each do |client_id|
      client = Client.find_by_id(client_id)
      next if client.nil?

      ClientsTechnique.create!(client: client, technique: technique)
    end
    
    redirect_to dashboard_path, notice: "You invited users to technique."
  end

  private

  def clients_technique_params
    params.require(:clients_technique).permit(:client_id, :technique_id, :client_id)
  end
end
