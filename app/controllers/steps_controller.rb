class StepsController < InheritedResources::Base

  private

    def step_params
      params.require(:step).permit(:title, :description, :image, :video, :audio)
    end

end
