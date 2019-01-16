class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render 'new'
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
    params.require(:user).permit(:username, :password)
  end
end