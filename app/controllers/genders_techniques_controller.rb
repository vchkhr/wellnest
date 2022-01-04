class GendersTechniquesController < InheritedResources::Base

  private

    def genders_technique_params
      params.require(:genders_technique).permit(:gender_id, :technique_id)
    end

end
