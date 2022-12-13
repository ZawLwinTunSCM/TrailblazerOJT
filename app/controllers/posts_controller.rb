class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    run Post::Operation::Create::Present
    @post = result[:model]
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post Created Successfully'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post Updated Successfully'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post Deleted Successfully'
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
