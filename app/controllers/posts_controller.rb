class PostsController < ApplicationController
  def show
    @post =  Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "You post has been created"
      redirect_to @post
    else
      flash[:alert] = "You need an image to post!"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
