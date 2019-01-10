class PostsController < ApplicationController
  before_action :require_post_author, only: [:edit, :update]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render 'new'
    end
  end

  def new
    @post = Post.new
    render 'new'
  end

  def show
    @post = Post.find(params[:id])
    render 'show'
  end

  def edit
    @post = Post.find(params[:id])
    render 'edit'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to subs_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
    # sub_id => checkboxes, arrays
  end

  def require_post_author
    @post = Post.find(params[:id])
    unless logged_in? && current_user == @post.author
      flash[:errors] = "Only the author of a post can edit it"
      redirect_to post_url(@post)
    end
  end
end