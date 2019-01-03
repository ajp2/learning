class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login_user!
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password])

    if user.nil?
      render json: "Invalid username of password"
    else
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    end
  end

  def already_logged_in
    redirect_to cats_url if current_user
  end
end
