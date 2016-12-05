# Application Controller class
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authorize!
    redirect_to root_path unless current_user
  end

  def current_user
    SessionToken.user(session[:user_token])
  end

  helper_method :current_user
end
