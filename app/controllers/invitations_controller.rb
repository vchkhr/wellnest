class InvitationsController < InheritedResources::Base
  before_action :set_invitation, only: %i[ show edit update destroy ]

  def index
    @invitations = Invitation.where(status: 0, coach: current_user.coach)
  end

  def new
    coach = Coach.find(params['coach_id'])
    @coach_name = coach.name

    if params.key?(:status)
      Invitation.where(client: current_user.client).destroy_all

      Invitation.create!(client: current_user.client, coach: coach, status: 0)

      text = "You asked #{@coach_name} to become your coach"
      Notification.create!(client: current_user.client, text: text)
      redirect_to dashboard_path, notice: text
    end
  end

  def edit
    client = Client.find(params['client_id'])
    coach = current_user.coach
    @invitation = Invitation.where(client: client, coach: coach).last
    
    if params['is_confirmed'] == 'true'
      @invitation.status = 1
      @invitation.save

      coach.increment!(:total_clients_count, 1)
    else
      @invitation.destroy
    end

    respond_to do |format|
      action = params['is_confirmed'] == 'true' ? 'confirmed' : 'refused'

      text = "You #{action} invitation from #{client.name}"
      Notification.create!(client: client, text: "Coach #{current_user.name} #{action} your invitation")
      CoachNotification.create!(coach: coach, text: text)

      format.html { redirect_to invitations_path, notice: text }
      format.json { render :show, status: :created, location: @invitation }
    end
  end

  def destroy
    coach_name = @invitation.coach.name
    @invitation.destroy

    respond_to do |format|
      unless current_user.nil?
        text = "You have ended cooperation with #{coach_name}"
        Notification.create!(client: current_user.client, text: text)
      end

      format.html { redirect_to dashboard_path, notice: text }
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
