class ApplicationController < ActionController::Base
  private
  def authenticate_user!
    if user_signed_in?
      redirect_to dashboard
    else
      redirect_to home_path
    end
  end
end
