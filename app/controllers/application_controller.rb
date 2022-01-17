class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :profile_image
  helper_method :cover_image
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def profile_image(user)
    if user.profile.image.attached?
      user.profile.image
    else
      "https://devshift.biz/wp-content/uploads/2017/04/profile-icon-png-898.png"
    end
  end

  def cover_image(technique)
    unless technique.image.nil?
      technique.image
    else
      "behaviour-therapy.jpg"
    end
  end
end
