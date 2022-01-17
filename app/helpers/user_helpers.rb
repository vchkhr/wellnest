module UserHelpers
  def profile_image(user)
    if user.profile.image.attached?
      user.profile.image
    else
      "https://devshift.biz/wp-content/uploads/2017/04/profile-icon-png-898.png"
    end
  end
end
