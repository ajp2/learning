class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render 'new'
    end
  end

  def new
    render 'new'
  end

  def show
    @comment = Comment.find(params[:id])
    render 'show'
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

  def require_login
    unless logged_in?
      flash[:errors] = "Must be logged in to create a comment"
      redirect_to subs_url
    end
  end
end