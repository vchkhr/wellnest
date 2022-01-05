module UserManager
  class ProfileImage < ApplicationService
    def initialize(user)
      @user = user
    end
  
    def call()
      profile_image
    end
  
    private
  
    def profile_image
      size = "50x50"
      alt = @user.name

      if @user.profile.image.attached?
        @user.profile.image
      else
        "https://devshift.biz/wp-content/uploads/2017/04/profile-icon-png-898.png"
      end
    end
  end
end
