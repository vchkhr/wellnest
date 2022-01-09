class InvitationsController < InheritedResources::Base
  before_action :set_invitation, only: %i[ show edit update destroy ]

  def index
    @invitations = Invitation.where(status: 0, coach: current_user.coach)
  end

  def new
    coach = Coach.find(params['coach_id'])
    @coach_name = coach.user.name

    if params.key?(:status)
      Invitation.where(client: current_user.client).each { |invitation| invitation.destroy }

      Invitation.create!(client: current_user.client, coach: coach, status: params['status'])

      redirect_to dashboard_path, notice: "You asked #{@coach_name} to become your coach"
    end
  end

  def edit
    Invitation.where(client: Client.find(params['client_id']), coach: current_user.coach, status: 0).each { |invitation| invitation.destroy }

    if params['is_confirmed'] == 'true'
      @invitation = Invitation.new(client: Client.find(params['client_id']), coach: current_user.coach, status: 1)
    end
    
    respond_to do |format|
      if @invitation.save
        action = params['is_confirmed'] == 'true' ? "confirmed" : "refused"

        format.html { redirect_to invitations_path, notice: "You #{action} invitation from the client" }
        format.json { render :show, status: :created, location: @invitation }
      end
    end
  end

  def destroy
    coach_name = @invitation.coach.user.name
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: "You have ended cooperation with #{coach_name}" }
      format.json { head :no_content }
    end
  end

  private
  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:status, :client_id, :coach_id)
  end
end
