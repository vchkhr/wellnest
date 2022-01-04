class CoachesController < ApplicationController
  before_action :set_coach, only: %i[ show edit update destroy ]

  def index
    @coaches = Coach.all
  end

  def show
  end

  def new
    @coach = Coach.new
  end

  def edit
  end

  def create
    @coach = Coach.new(coach_params)
    @coach.user = current_user

    params[:coach][:problem_ids].each do |pr|
      problem = Problem.find_by_id(pr)
      @coach.problems << problem unless problem.nil?
    end

    respond_to do |format|
      if @coach.save
        format.html { redirect_to dashboard_path, notice: "Coach was successfully created." }
        format.json { render :show, status: :created, location: @coach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coach.update(coach_params)
        format.html { redirect_to dashboard_path, notice: "Personal information was successfully updated." }
        format.json { render :show, status: :ok, location: @coach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coach.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Coach was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_coach
      @coach = Coach.find_by_id(params[:id])
      @coach = current_user.coach if @coach.nil?
    end

    def coach_params
      params.require(:coach).permit(:image, :age, :education, :work, :licenses, :links, :user_id, :gender_id, :problem_ids)
    end
end
