class CommentsController < ApplicationController
  def index
    user = comment_params[:user_id]
    artwork = comment_params[:artwork_id]
    if user
      render json: Comment.find_by(user_id: user)
    elsif artwork
      render json: Comment.find_by(artwork_id: artwork)
    else
      render json: "Supply user_id or artwork_id"
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end