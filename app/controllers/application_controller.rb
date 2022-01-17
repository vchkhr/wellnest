class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
  helper_method :current_user

  def profile_image(user)
    if user.profile.image.attached?
      user.profile.image
    else
      "https://devshift.biz/wp-content/uploads/2017/04/profile-icon-png-898.png"
    end
  end
  helper_method :profile_image

  def cover_image(technique)
    unless technique.image.nil?
      technique.image
    else
      "behaviour-therapy.jpg"
    end
  end
  helper_method :cover_image

  def completed_steps_in_technique(technique)
    ClientManager::CompletedStepsInTechnique.call(technique)
  end
  helper_method :completed_steps_in_technique

  def techniques_completed(client)
    ClientManager::TechniquesCompleted.call(client)
  end
  helper_method :techniques_completed

  def techniques_in_progress(client)
    ClientManager::TechniquesInProgress.call(client)
  end
  helper_method :techniques_in_progress

  def techniques_not_started(client)
    ClientManager::TechniquesNotStarted.call(client)
  end
  helper_method :techniques_not_started
end
