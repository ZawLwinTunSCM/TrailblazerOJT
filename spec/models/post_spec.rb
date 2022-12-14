require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:post_params) do
    {
      title: 'post title',
      body: 'post body'
    }
  end

  let(:invalid_params) do
    {
      title: '',
      body: ''
    }
  end

  # Post List
  context 'GET /posts' do
    it 'get post list' do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  # Create Post
  context 'POST /posts/new' do
    it 'valid post params' do
      post '/posts', params: { post: post_params }
      expect"Post Created Successfully"
    end
  end

  # Post Details
  context 'GET /posts/:id' do
    it 'Post Details' do
      post = Post.create(post_params)
      get "/posts/#{post.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  # Post Update
  context 'PATCH /posts/:id/edit' do
    it 'valid post params' do
      post = Post.create(post_params)
      patch "/posts/#{post.id}", params: { post: post_params }
      expect "Post updated successfully"
    end
  end

  # Post Delete
  context 'Delete /posts/:id' do
    it 'Delete post' do
      post = Post.create(post_params)
      delete "/posts/#{post.id}"
      expect"Post deleted successfully"
    end
  end
end
