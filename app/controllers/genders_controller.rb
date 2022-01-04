class GendersController < InheritedResources::Base

  private

    def gender_params
      params.require(:gender).permit(:name, :client, :coach)
    end

end
