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
      post.status = 1
      post.save!
      redirect_to posts_path, :flash => { :success => 'Post Created Successfully!' }
  end

  def create
    run Post::Operation::Create do |_result|
      return redirect_to posts_path, :flash => { :success => 'Post Created Successfully!' }
    end
    render :new, :flash => { :danger => 'Post Creation Failed!' }
  end

  def show
    run Post::Operation::Show
  end

  def edit
    run Post::Operation::Update::Present
  end

  def update
    run Post::Operation::Update do |_result|
      return redirect_to posts_path, :flash => { :success => 'Post Updated Successfully!' }
    end
    render :edit, :flash => { :success => 'Post Updation Failed!' }
  end

  def destroy
    run Post::Operation::Destroy do |_result|
      redirect_to posts_path, :flash => { :success => 'Post Deleted Successfully' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :status)
  end
end
