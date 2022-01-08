class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if not user
      flash[:notice] = 'The e-mail you entered is incorrect'
      redirect_to reset_password_path

      return
    end

    user.send_password_reset

    flash[:notice] = user.email
    redirect_to check_your_email_path
  end

  def edit
    @user = User.find_by_password_reset_token(params[:id])

    redirect_to root_url, notice: "Password reset has expired" unless @user
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])

    if @user.password_reset_sent_at < 2.hour.ago
      flash[:notice] = 'Password reset has expired'
      redirect_to new_password_reset_path
    
    elsif @user.update(user_params)
      flash[:notice] = 'Password has been reset!'
      redirect_to new_session_path
    
    else
      render :edit
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:password)
    end
end
