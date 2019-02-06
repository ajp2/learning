class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login_user!(@user)
      render "api/users/show"
    else
      render json: { error: "Invalid credentials" }, status: 422
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil;
      render json: {}
    else
      render json: { error: "Not logged in" }, status: 404
  end
end
