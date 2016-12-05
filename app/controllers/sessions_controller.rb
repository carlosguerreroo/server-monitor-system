# SessionsController class
class SessionsController < ApplicationController
  def new
    redirect_to manager_root_path if current_user
  end

  def create
    user = User.find_by_username(user_params[:username])
    if user && user.authenticate(user_params[:password])
      sign_in(user)
      redirect_to manager_root_path
    else
      flash.now[:alert] = 'Invalid credentials!'
      render :new
    end
  end

  def destroy
    sign_out(session[:user_token])
    flash[:notice] = 'You have successfully logged out!'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def sign_in(user)
    session[:user_token] = user.generate_session_token
  end

  def sign_out(token)
    SessionToken.expire_token!(token)
  end
end
