class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  
  def index
    @clients = Client.where_coach(current_user.coach)
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
  
    params[:client][:problem_ids].each do |pr|
      problem = Problem.find_by_id(pr)
      @client.problems << problem unless problem.nil?
    end

    respond_to do |format|
      if @client.save
        text = "#{@client.user.name}, you have completed the registration"

        Notification.create!(client: @client, text: text)
        format.html { redirect_to dashboard_path, notice: text }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        @client.problems.destroy_all
        params[:client][:problem_ids].each do |pr|
          problem = Problem.find_by_id(pr)
          @client.problems << problem unless problem.nil?
        end
        
        text = 'You have updated your personal information'

        Notification.create!(client: @client, text: text)
        format.html { redirect_to dashboard_path, notice: text }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Client was successfully destroyed" }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find_by_id(params[:id])
      @client = current_user.client if @client.nil?
    end

    def client_params
      params.require(:client).permit(:image, :age, :bio, :user_id, :gender, :problem_ids)
    end
end
