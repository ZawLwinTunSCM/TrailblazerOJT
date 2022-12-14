class RandomPostJob
  include Sidekiq::Job

  def perform(*_args)
    post = Post.new
    post.title = 'Random Title'
    post.body = 'Random Body'
    post.save!
    sleep 5
  end
end
