class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = "Invalid username or password"
      redirect_to new_session_url
    end
  end

  def new
    render 'new'
  end

  def destroy
    @user = User.find(current_user.id)
    @user.reset_session_token!
    session[:session_token] = nil
    redirect_to users_url
  end
end