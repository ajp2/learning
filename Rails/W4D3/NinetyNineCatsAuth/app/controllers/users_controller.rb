class UsersController < ApplicationController
  before_action :already_logged_in, only: [:new]

  def new
    render 'new'
  end

  def create
    user = User.new(user_params)
    if user.save
      login_user!
    else
      flash.now[:errors] = user.errors.full_messages
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end