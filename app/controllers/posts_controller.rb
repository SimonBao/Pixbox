class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

  def show
  end

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "You post has been created"
      redirect_to @post
    else
      flash[:alert] = "You need an image to post!"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated.'
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed. Please check form."
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Problem solved! Post deleted."
      redirect_to posts_path
    else
      flash.now[:alert] = "Oh no! It's still alive!"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
  unless current_user == @post.user
    flash[:alert] = "That post doesn't belong to you!"
    redirect_to root_path
  end
end

end
