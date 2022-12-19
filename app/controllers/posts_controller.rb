class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]
  require 'faker'
  def index
    run Post::Operation::Index, current_user: current_user
    #@model = @model.paginate(:page => params[:page],:per_page => 5)
  end

  def new
    run Post::Operation::Create::Present
  end

  def create_random
    #RandomPostJob.perform_async
    #RamdomJob.perform_later
      post = Post.new
      post.title = Faker::Superhero.name
      post.body = Faker::Superhero.power
      post.user_id = current_user.id
      post.public_flag = 3
      post.save!
      redirect_to posts_path, notice: 'Post Created Successfully'
  end

  def create
    run Post::Operation::Create do |_result|
      return redirect_to posts_path, notice: 'Post Created Successfully'
    end
    render :new, notice: 'Failed to create post'
  end

  def show
    run Post::Operation::Show
  end

  def edit
    run Post::Operation::Update::Present
  end

  def update
    run Post::Operation::Update do |_result|
      return redirect_to posts_path, notice: 'Post Updated Successfully'
    end
    render :edit, notice: 'Failed to update post'
  end

  def destroy
    run Post::Operation::Destroy do |_result|
      redirect_to posts_path, notice: 'Post deleted successfully'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :public_flag)
  end
end
