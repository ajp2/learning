class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new]

  def new
    render 'new'
  end

  def create
    login_user!
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to cats_url
  end
end