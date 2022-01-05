class TechniquesController < InheritedResources::Base
  def show
    @technique = Technique.find_by_id(params[:id])
    steps = @technique.steps
    @step = nil
    @step_count = 0
    @step_all = steps.count

    steps.each do |step|
      @step = step
      @step_count += 1
      break if CompletedStep.where(client: current_user.client, step: step).empty?
    end
  end

  private
  def technique_params
    params.require(:technique).permit(:title, :description, :image, :age_start, :age_end, :duration_start, :duration_end)
  end
end
