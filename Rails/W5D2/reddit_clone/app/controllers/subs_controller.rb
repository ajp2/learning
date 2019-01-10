class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit, :update]

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render 'new'
    end
  end

  def new
    @sub = Sub.new
    render 'new'
  end

  def index
    @subs = Sub.all
    render 'index'
  end

  def show
    @sub = Sub.find(params[:id])
    render 'show'
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render 'edit'
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render 'edit'
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator
    @sub = Sub.find(params[:id])
    unless logged_in? && current_user.id == @sub.moderator.id
      flash[:errors] = "Must be a moderator to edit this sub"
      redirect_to sub_url(params[:id])
    end
  end
end