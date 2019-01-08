class GoalsController < ApplicationController
  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render 'new'
    end
  end

  def index
    render 'index'
  end

  def show
    @goal = Goal.find(params[:id])
    render 'show'
  end

  def new
    render 'new'
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.completed = !@goal.completed
    @goal.save
    redirect_to goal_url(@goal)
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(current_user)
  end

  private
  def goal_params
    temp_params = params.require(:goal).permit(:title, :details, :completed, :private)
    temp_params[:private] = temp_params[:private] == "on" ? true : false
    temp_params[:completed] = temp_params[:completed] == "on" ? true : false
    temp_params[:user_id] = current_user.id
    temp_params
  end
end