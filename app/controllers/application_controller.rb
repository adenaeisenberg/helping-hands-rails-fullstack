class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user
    redirect_to "/login", status: :see_other unless current_user
  end

  def authenticate_admin
    unless current_user && current_user.admin
      render "users/nonadmin"
      # status: :unauthorized
    end
  end
end
