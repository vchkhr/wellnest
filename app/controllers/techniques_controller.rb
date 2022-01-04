class TechniquesController < InheritedResources::Base

  private

    def technique_params
      params.require(:technique).permit(:title, :description, :image, :age_start, :age_end, :duration_start, :duration_end)
    end

end
