class TechniquesController < InheritedResources::Base
  def show
    @technique = Technique.find_by_id(params[:id])

    @steps = @technique.steps
    @step = nil
    @step_count = 0
    @step_all = @steps.count

    unless current_user.client.nil?
      @steps.each do |step|
        @step = step
        @step_count += 1
        break if CompletedStep.where(client: current_user.client, step: step).empty?
      end

      @steps = nil
    end
  end

  def all
    if !params.key?(:filters) or (params[:filters][:problem_ids].count == 1 and params[:filters][:genders].count == 1)
      @techniques = Technique.all
    else
      filters = params[:filters].slice!(:problem_ids, :genders)
      @techniques = Technique.all

      if filters[:problem_ids].count > 1
        problems = filters[:problem_ids].split(',')

        problems.each do |problem|
          @techniques = @techniques.joins(:problems_techniques).where('problems_techniques.problem_id' => problem)
        end

      end

      if filters[:genders].count > 1
        genders = filters[:genders].join(',')
        
        if genders == 'male'
          @techniques = @techniques.males
        elsif genders == 'female'
          @techniques = @techniques.females
        end
      end
    end
  end

  private
  def technique_params
    params.require(:technique).permit(:title, :description, :image, :age_start, :age_end, :duration_start, :duration_end)
  end
end
