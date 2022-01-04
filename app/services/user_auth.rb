class UserAuth < ApplicationService
  def initialize(session)
    @session = session
  end

  def call()
    user_auth
  end

  private

  def user_auth
    User.find(@session['user_id'])
  end
end
