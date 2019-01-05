class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]

  def create
    user = User.new(user_params)
    if user.save
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = "Need email and password"
      render 'new'
      # render json: user.errors.full_messages
    end
  end

  def new
    render 'new'
  end

  def show
    @user = User.find(params[:id])
    render 'show'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end