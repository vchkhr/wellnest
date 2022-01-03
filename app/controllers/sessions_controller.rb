class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      notice = "Logged in!"

      # if !user.coach and !user.client
      #   redirect_to
      # else
        redirect_to root_url, notice: notice
      # end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
