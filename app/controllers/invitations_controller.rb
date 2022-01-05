class InvitationsController < InheritedResources::Base
  before_action :set_invitation, only: %i[ show edit update destroy ]

  def new
    coach = Coach.find(params['coach_id'])
    @coach_name = coach.user.name

    if params.key?(:status)
      Invitation.where(client: current_user.client).each { |invitation| invitation.destroy }

      Invitation.create!(client: current_user.client, coach: coach, status: params['status'])

      redirect_to dashboard_path, notice: "You asked #{@coach_name} to become your coach"
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
